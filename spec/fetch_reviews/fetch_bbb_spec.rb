RSpec.context 'fetch bbb reviews' do
  subject { FetchReviews.bbb }

  it 'should parse bbb reviews', vcr: true do
    expect(subject.size).to eq(10)

    expect(subject.map(&:author_name)).to eq([
      'Erica G',
      'Jorge D.',
      'Shaquana',
      'Melissa',
      'Nicole H',
      'Ashley R.',
      'Holli B',
      'Darlene H',
      'Sean C',
      'Nia W.'
    ])

    expect(subject.map(&:date).map(&:to_s)).to eq([
      "2020-01-07T00:00:00+00:00",
      "2020-01-02T00:00:00+00:00",
      "2019-12-31T00:00:00+00:00",
      "2019-12-20T00:00:00+00:00",
      "2019-12-14T00:00:00+00:00",
      "2019-10-20T00:00:00+00:00",
      "2019-10-05T00:00:00+00:00",
      "2019-09-06T00:00:00+00:00",
      "2019-07-11T00:00:00+00:00",
      "2019-06-04T00:00:00+00:00"
    ])

    expect(subject.map(&:rating)).to eq([1, 1, 1, 1, 1, 1, 1, 1, 1, 1])

    expect(subject.first.text).to start_with("I placed an order for several items around Thanksgiving.")
    expect(subject.last.text).to end_with("I know about this treatment.")
  end
end
