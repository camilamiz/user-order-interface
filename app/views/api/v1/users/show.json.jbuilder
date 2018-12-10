json.extract! @user, :id, :name, :cpf, :email
json.comments @user.orders do |order|
  json.extract! order, :id, :model, :imei, :annual_price, :number_of_installments, :user_id
end
