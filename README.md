# Gatsby Eyewear

### Description

A mock ecommerce website for an eyewear brand inspired by the Lost Generation of the 'roaring 20s'. This website is purely to practice design using Rails as backend and JQuery as client.

### ActiveRecord Associations

1. A user has_one cart
2. A cart belongs to a user
3. A user has many orders
4. An order belongs_to a user
5. An order has_many line_items
6. An order has many products through line_items
7. A product has many line_items
8. A product has many orders through line_items
9. A product has many reviews
10. A review belongs_to a product and belongs_to a user
11. A line_item belongs to a product, belongs_to an order, belongs_to a cart

### Login/Signup:
1. a user can login through the regular portal
2. a user can login through Facebook (utilizes omniauth FB gem)
3. a user can create an account through the regular portal
4. a user can create an account through Facebook

### Controllers:

1. application
2. carts
3. line_items
4. orders
5. products
6. reviewssessions
7. statics
8. users

### Helper Methods
1. current_user
2. logged_in?
3. current_cart
4. current_order
5. session_user

### Model Validations

#### User
1. validates presence of email and formatting
2. validates uniqueness
3. validates password confirmation and password length

#### Review
1. validates presence of title, comment, product rating, user id, product id
2. validates length of comments min of 3 characters
3. validates product rating inclusion of 1-5

#### User
1. validates presence of email and formatting
2. validates uniqueness
3. validates password confirmation and password length

## Scope Method
1. Product.by_highest_rating

## User Submittable Attribute
1. line_items.quantity







Blog ----> https://yosayonnyc.wordpress.com/2018/05/22/my-first-ror-project-gatsby_designs/


Youtube Video ----> https://youtu.be/aUroASfUuW4


### Ruby Version ----> 2.3.3

### Installation Instructions 

#### 1. git clone 
#### 2. bundle install
#### 3. rake db:migrate
#### 4. rake db:seed
#### 3. rails s

### Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/yosayon/gatsby_designs. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

### License
The repo is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


