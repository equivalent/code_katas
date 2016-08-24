class Article < ApplicationRecord
  def as_json
    {
      id: id,
      title: title
    }
  end
end
