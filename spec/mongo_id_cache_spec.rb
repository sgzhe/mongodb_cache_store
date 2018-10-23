
RSpec.describe ActiveSupport::Cache::MongoIdCacheStore do
  Mongoid.load_configuration(clients: {
      default: {
          database: 'rails_cache_store',
          hosts: ['127.0.0.1']
      }
  })
  let(:store) { ActiveSupport::Cache::MongoIdCacheStore.new }

  it 'should test read and write' do
    store.write('foo', 'bar')
    expect(store.read('foo')).to eq('bar')
  end

  it 'should test delete key matching' do
    store.write('foo', 'bar')
    store.write('fooz', 'baz')
    store.delete_matched(/foo/)
    expect(store.exist?('foo')).to eq(false)
    expect(store.exist?('fooz')).to eq(false)
  end

  it 'should clear all cache key' do
    store.write('foo', 'bar')
    store.write('fu', 'baz')
    store.clear
    expect(store.exist?('foo')).to eq(false)
    expect(store.exist?('fu')).to eq(false)
  end

  it 'should test value with marshal' do
    store.write('foo', [])
    expect(store.read('foo')).to eq([])
  end

  it 'should cleanup remove all expired entries' do
    time = Time.now
    store.write('foo', 'bar', expires_in: 10)
    store.write('baz', 'qux')
    store.write('quux', 'corge', expires_in: 20)
    sleep(15)
    store.cleanup
    expect(store.exist?('foo')).to eq(false)
    expect(store.exist?('baz')).to eq(true)
    expect(store.exist?('quux')).to eq(true)
  end

end