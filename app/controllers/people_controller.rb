class PeopleController < ApplicationController
  def index
    @persons = Person.all
  end

  def show
    @persons = Person.find(params[:id])
  end

  def new
    @persons = Person.new
  end

  def edit
    @persons = Person.find(params[:id])
  end

  def update
    @persons = Person.find(params[:id])
    if @persons.update(persons_params)
      redirect_to person_path(@persons)
    else
      render :edit
    end
  end

  def create
    @persons = Person.new(persons_params)

    if @persons.save
      redirect_to people_path
    else
      render :new
    end
  end

def destroy
  Person.find(params[:id]).destroy
  redirect_to people_path
end

private
def persons_params
  params.require(:person).permit(:first_name, :last_name, :age, :career, :single, :movie_quote)
end

end