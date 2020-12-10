class Form::Base
  include ActiveModel::Model
  include ActiveModel::Callbacks
  include ActiveModel::Validations
  # モデルであるためには、errorsメソッドが必要。バリデーションに関するメソッド。
  include ActiveModel::Validations::Callbacks

end
