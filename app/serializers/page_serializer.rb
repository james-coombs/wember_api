class PageSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :board, :can_be_deleted, :image, :image_url,
             :attached_image, :board_id
  has_one :user

  def board
    object.board_id
  end

  def can_be_deleted
    scope == object.user
  end

  # property for attaching file to be uploaded
  def attached_image
    scope == object.image_file_name
  end
end
