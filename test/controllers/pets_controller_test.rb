require "test_helper"

describe PetsController do
  let(:pet) { pets :one }

  it "gets index" do
    get pets_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_pet_url
    value(response).must_be :success?
  end

  it "creates pet" do
    expect {
      post pets_url, params: { pet: { age: pet.age, breed: pet.breed, human: pet.human, name: pet.name } }
    }.must_change "Pet.count"

    must_redirect_to pet_path(Pet.last)
  end

  it "shows pet" do
    get pet_url(pet)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_pet_url(pet)
    value(response).must_be :success?
  end

  it "updates pet" do
    patch pet_url(pet), params: { pet: { age: pet.age, breed: pet.breed, human: pet.human, name: pet.name } }
    must_redirect_to pet_path(pet)
  end

  it "destroys pet" do
    expect {
      delete pet_url(pet)
    }.must_change "Pet.count", -1

    must_redirect_to pets_path
  end
end
