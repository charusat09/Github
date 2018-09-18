class GithubRepo
  include HTTParty

  def search(query)
    data = self.class.get("https://api.github.com/search/repositories?q=#{query}&sort=stars&order=desc&page=1&per_page=10", format: :plain, headers: headers)
    json = JSON.parse data, symbolize_names: true
    response = []
    json[:items].each do |item|
      data = []
      data << "#{item[:owner][:login]}/#{item[:name]}"
      data << item[:language]
      data << latest_tag(item[:tags_url])
      data << item[:html_url]
      response << data
    end
    response
  end

  private

  def latest_tag(url)
    tags = self.class.get("#{url}?order=desc", headers: headers)
    tags.parsed_response.present? ? tags.parsed_response.first["name"] : ""
  end

  def headers
    {
      "Authorization": "token #{ENV['github_token']}",
      "User-Agent": "Mozilla/5.0"
    }
  end
end
