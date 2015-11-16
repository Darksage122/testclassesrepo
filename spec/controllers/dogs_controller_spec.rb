require 'rails_helper'

RSpec.describe DogsController, :type => :controller do 
	let(:valid_session) do
		{dog_id: 1}
	end

	let(:valid_attributes) do   
	
	{     
		name: "Fluffy",     
		email: "fluffster@aol.com",     
		password: "testtest",     
		password_confirmation: "testtest",     
		birthday: Time.now-3.years,     
		city: "New York",     
		state: "NY",     
		newsletter: true   } 
	end

	let(:valid_session) { {dog_id: 1} }

	let(:dog) { Dog.create valid_attributes}

	let(:invalid_attribute) do 
		{email: nil}
	end

	describe "GET index" do   
		it "assigns all dogs as @dogs" do     
			dog = Dog.create! valid_attributes     
			get :index, {}, valid_session     
			expect(assigns(:dogs)).to eq([dog])   
		end 
	end


	describe "GET show" do   
		it "assigns the requested dog as @dog" do   
			dog = Dog.create! valid_attributes
			get :show, { id: dog.id}, valid_session
			expect(assigns(:dog)).to eq(dog)
		end
	end 
		
	describe "GET new" do
		it "assigns a new dog as @dog" do
			get :new, {}, valid_session
			expect(assigns(:dog)).to be_instance_of(Dog)
		end
	end


	describe "GET edit" do     
	it "assigns the requested dog as @dog" do         
		get :edit, { id: dog.id}, valid_session
		expect(assigns(:dog)).to eq(dog)	
		end  
	end

	describe "POST create" do
		it "creates the requested dog" do
				post :create, { dog: valid_attributes}, valid_session
				expect(assigns(:dog)). to eq(Dog.find_by_email(valid_attributes[:email]))	
		end
	end	

		it "assigns the requested dog to @dog" do
			post :create, { dog: valid_attributes }, valid_session
			expect(assigns(:dog)). to eq(Dog.find_by_email(valid_attributes[:email]))
	end
	
	describe "DELETE destroy" do
		it "destroys the requested dog" do
			dog = Dog.create! valid_attributes
			delete :destroy, { id: dog.id }, valid_session
			expect(Dog.find_by_id(dog.id)). to be_nil
		end
	end	

		it "redirects to the dogs list" do
			dog = Dog.create! valid_attributes
			delete :destroy, { id: dog.id }, valid_session
			expect(response).to redirect_to(dogs_path)
	end

		it "redirects to a specific dog" do
			post :create, { dog: valid_attributes}, valid_session
			expect(response).to redirect_to assigns(:dog)
	end
		context "when invalid attributes" do
		it "does not create requested dog" do
			post :create, { dog: invalid_attribute }, valid_session
			expect(Dog.find_by_email(valid_attributes[:email])).to be_nil
		end
	end
		it "renders the new template" do
			post :create, { dog: invalid_attribute}, valid_session
			expect(response).to render_template :new
		end
		describe "Put Update" do
		context "whan valid attributes" do
		dog = Dog.create! valid_attributes
		name = "dog name"
		put :update, { id: dog.id, dog: { name: name } }, valid_session 
		expect(assigns(:dog)).to eq(Dog.find_by_email(dog.email]))	
		end
	end		
end

 describe "is invalid without a " do     
 	let(:dog){ Dog.new(valid_attributes) }     
 	it "name" do
    dog.name = nil       
    expect(dog).to be_invalid     
	end 
end

    
 	it "birthday" do
    dog.name = nil       
    expect(dog).to be_invalid     
	end 
end

 	it "city" do
    dog.name = nil       
    expect(dog).to be_invalid     
	end 
end


 	it "name" do
    dog.name = nil       
    expect(dog).to be_invalid     
	end 
end