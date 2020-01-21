class ZombiesController < ApplicationController

  def index
    @zombies = Zombie.all
  end

  def show
  end

  def new
    @zombie = Zombie.new
  end

  def edit
  end

  def create
    @zombie = Zombie.new(zombie_params)

    respond_to do |format|
      if @zombie.save
        format.html { redirect_to @zombie, notice: "Item criado com sucesso" }
        format.json { render :show, status: :created, location: @zombie }
      else
        format.html { render :new }
        format.json { render json: @zombie.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    respond_to do |format|
      if @zombie.update(kind_params)
        format.html { redirect_to @zombie, notice: "Item atualizado com sucesso" }
        format.json { render :show, status: :ok, location: @zombie }
      else
        format.html { render :edit }
        format.json { render json: @zombie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @zombie.destroy
    respond_to do |format|
        format.html { redirect_to zombies_url, notice: "Item excluido com sucesso" }
        format.json { head :no_content }
      end
    end

  end
