class UsersController < ApplicationController
    # Create a UsersController with a create method that responds to a POST /signup request. 
    def create
        # create a new user
        # save their hashed password in the database
        user = User.create(user_params)
        if user.valid?
            # save the user's ID in the session hash
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show
        user = User.find_by(id: session[:user_id])
        if user
            render json: user, status: :created
        else
            render json: { error: "Invalid username or password" }, status: :unauthorized
        end
    end
    private
    def user_params
        params.permit(:username, :password, :password_confirmation)
    end
end


# Create a UsersController with a create method that responds to a POST /signup request. It should: create a new user; save their hashed password in the database; save the user's ID in the session hash; and return the user object in the JSON response.

# Add a show method to your UsersController that responds to a GET /me request. If the user is authenticated, return the user object in the JSON response.
# def create
#     user = User.find_by(username: params[:username])
#       session[:user_id] = user.id
#       render json: user, status: :created
#   end


        # # return the user object in the JSON response.
        # render json: user, status: :created