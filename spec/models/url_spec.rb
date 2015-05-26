require 'rails_helper'
RSpec.describe Url, type: :model do
  context 'slug not passed' do
    it 'should save item' do
      url = Url.create(url: 'http://google.com')
      expect(url.slug).not_to be_empty
    end
  end

  context 'slug passed' do
    it 'should save item without error' do
      slug = 'hello123'
      url = Url.create(url: 'http://google.com', slug: slug)
      expect(url.slug).to eq(slug)
      expect(url.errors).to be_empty
    end

    it 'should have validation error for slug' do
      slug = 'hello123'
      Url.create(url: 'http://google.com', slug: slug)
      url = Url.create(url: 'http://google.com', slug: slug)
      expect(url.errors).not_to be_empty
    end
  end

  it 'should call generate method of Shortener when when slug is empty' do
    allow(Shortener).to receive(:generate).and_return('xyz')
    url = Url.create(url: 'http://google.com')
    expect(Shortener).to have_received(:generate)
    expect(url.slug).to eq('xyz')
  end

  it 'should retry if a slug already exists' do
    allow(Shortener).to receive(:generate).and_return('xyz')
    url1 = Url.create(url: 'http://google.com')
    url2 = Url.create(url: 'http://google2.com')
    expect(Shortener).to have_received(:generate).exactly(6).times
  end
end
