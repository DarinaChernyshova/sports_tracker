class AddConfirmableToUsers < ActiveRecord::Migration[8.0]
  def change
    # Добавляем поля для подтверждения email
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string
    
    # Добавляем индекс для токена
    add_index :users, :confirmation_token, unique: true
    
    # Подтверждаем всех существующих пользователей
    User.update_all(confirmed_at: Time.current)
  end
end