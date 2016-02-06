class Post
  include ActiveModel::Model

  attr_accessor :title, :body
  validates :title, presence: true
  validates :body, presence: true

  def save
    return false unless valid?
    client = DocBase::Client.new(team: ENV['POST_TEAM'])
    response = client.posts(title: title, body: body)
    return true if response.status == 201
    self.errors.add(:base, I18n.t('post.api_status_error'))
    false
  end
end
