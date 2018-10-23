#encoding: utf-8
require 'active_support'
require 'mongoid'

module ActiveSupport
  module Cache
    class MongoIdCacheStore < Store
      def initialize(options = {})
        options[:collection_name] ||= :rails_caches
        options[:expires_in] ||= 86400
        super(options)
      end

      def clear
        collection.delete_many
      end

      def cleanup
        collection.find(expires_at: {'$lt' => Time.now.to_f}).delete_many
      end

      def read_entry(key, options)
        query = {_id: key, expires_at: {'$gt': Time.now.to_f}}
        doc = collection.find(query).first
        return nil if doc.nil?
        entry = doc['raw'] ? doc['value'] : deserialize(doc['value'].data)
        entry.is_a?(Entry) ? entry : Entry.new(entry)
      end

      def write_entry(key, entry, raw: false, **options)
        query   = {_id: key}
        updates = {'$set': {
            value:  raw ? entry.value : serialize(entry),
            expires_at: entry.expires_at,
            raw: raw
        }}
        collection.update_one(query, updates, upsert: true)
      end

      def delete_entry(key, options = nil)
        collection.find(_id: key).delete_one
      end

      def delete_matched(matcher, options=nil)
        options = merged_options(options)
        collection.find(_id: key_matcher(matcher, options)).delete_many
      end

      def deserialize(value)
        Marshal.load(value) rescue value
      end

      def serialize(value)
        BSON::Binary.new(Marshal.dump(value))
      end

      private

      def collection
        ::Mongoid.default_client[@options[:collection_name]]
      end
    end
  end
end
