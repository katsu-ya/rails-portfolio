class PeopleController < ApplicationController
  layout "people"



  def index
    @people = Person.all
  end



  
  def show
    @person = Person.find(params[:id])
    @messages = @person.messages
  end



  def new
  @person = Person.new
  end



  def create
    @person = Person.new(person_params)

    if @person.save
      flash[:notice] = "登録しました。"
      redirect_to people_path
    else
      @msg = "入力に問題があります。"
      flash[:notice] = @msg
      render :add, status: :unprocessable_entity
    end
  end

  def edit
    @msg = "edit data.[id = #{params[:id]}]"
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    @person.update(person_params)
    redirect_to people_path
  end

  def delete
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to people_path
  end

  def find
    @people = []
    @msg = "Please type search word..."

    if request.post?
      if params[:find].present?
        redirect_to action: :find, find: params[:find]
      else
        @msg = "Search word cannot be empty."
      end
    else
      if params[:find].present?
        f = params[:find].split(",")
        @people = Person.all.limit(f[0]).offset(f[1])
        @msg = @people.any? ? "count = #{params[:find]}." : "No person found."
      end
    end
  end

  private

  def person_params
    params.require(:person).permit(:name, :age, :mail)
  end
end

 

