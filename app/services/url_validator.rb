class UrlValidator
  def initialize(url:)
    @url = url
  end

  def valid?
    URI::DEFAULT_PARSER.make_regexp(%w[http https]).match?(@url)
  end
end
