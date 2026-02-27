# db/migrate/20260204192205_add_post_id_to_comments.rb
class AddPostIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :post
  end
end
