require 'spec_helper'

describe SearchQueryParser do

  it 'has a version number' do
    expect(SearchQueryParser::VERSION).not_to be nil
  end

  it 'parse simple text query' do
    ret = SearchQueryParser.parse('query1 query2')
    expect(ret.fields).to eq({})
    expect(ret.texts).to eq(['query1', 'query2'])
  end

  it 'parse key:value query' do
    ret = SearchQueryParser.parse('key1:value1 key2:value2')
    expect(ret.fields.keys.size).to eq(2)
    expect(ret.fields['key1']).to eq(['value1'])
    expect(ret.fields['key2']).to eq(['value2'])
    expect(ret.texts).to eq([])
  end

  it 'parse duplicated-key:value query' do
    ret = SearchQueryParser.parse('key1:value1 key1:value2')
    expect(ret.fields.keys.size).to eq(1)
    expect(ret.fields['key1']).to eq(['value1', 'value2'])
    expect(ret.texts).to eq([])
  end

  it 'spaces, mixed' do
    ret = SearchQueryParser.parse('  key1:value1   key2:value2  text1  text2  ')
    expect(ret.fields.keys.size).to eq(2)
    expect(ret.fields['key1']).to eq(['value1'])
    expect(ret.fields['key2']).to eq(['value2'])
    expect(ret.texts).to eq(['text1', 'text2'])
  end

  it 'invalid key-value separator' do
    expect{SearchQueryParser.parse(':')}.to raise_error(SearchQueryParser::QueryParseError)
    expect{SearchQueryParser.parse(':invalid:separator')}.to raise_error(SearchQueryParser::QueryParseError)
    expect{SearchQueryParser.parse('invalid:separator:')}.to raise_error(SearchQueryParser::QueryParseError)
    expect{SearchQueryParser.parse('invalid:separator:invalid')}.to raise_error(SearchQueryParser::QueryParseError)
  end

  it 'text query with quotes' do
    expect(SearchQueryParser.parse('"text query with quotes"').texts).to eq(['text query with quotes'])
    expect(SearchQueryParser.parse('"text:query:with:quotes"').texts).to eq(['text:query:with:quotes'])
  end

  it 'key:value query qith quotes' do
    expect(SearchQueryParser.parse('key:"this is value"').fields['key']).to eq(['this is value'])
  end

  it 'invalid quote' do
    expect{SearchQueryParser.parse('"invalid quote "use case"')}.to raise_error(SearchQueryParser::QueryParseError)
    expect{SearchQueryParser.parse('"quoted""invalid"')}.to raise_error(SearchQueryParser::QueryParseError)
  end

end
