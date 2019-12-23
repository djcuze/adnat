class BaseForm
  include ActiveModel::Model
  include Virtus.model

  def save
    return false unless valid?
    persist
  end
end
