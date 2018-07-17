class BloggerService
  include HTTParty
  base_uri 'https://www.googleapis.com/blogger/v3'

  def get_posts()
    response = self.class.get(
      "/blogs/1036002535079583915/posts",
      query: {
        key: ENV['BLOGGER_KEY'],
        maxResults: 10
      }
    )

    posts = []
    if response['items']
      response['items'].each do |json_post|
        post = BlogPost.new()

        post.title = json_post['title']
        post.content = json_post['content']
        post.published = json_post['published']
        post.author = json_post['author']
        post.id = json_post['id']

        posts << post
      end
    end

    posts
  end

end
