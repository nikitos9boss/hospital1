# frozen_string_literal: true

class PacientQuery

  attr_accessor :initial_scope
  def initialize(initial_scope)
    @initial_scope = initial_scope
  end

  def call(params)
    scoped = search(initial_scope, params[:name])
    scoped = searchByAge(scoped, params[:age])
    scoped = searchByNumber(scoped, params[:number])
    if (params[:commit] == "SearchUp")
      scoped = sort(scoped, :name)
    elsif (params[:commit] == "SearchDown")
      scoped = sort(scoped, :name, :desc)
    elsif (params[:commit] == "SearchUp2")
      scoped = sort(scoped,:age)
    elsif (params[:commit] == "SearchDown2")
      scoped = sort(scoped,:age,:desc)
    elsif (params[:commit] == "SearchUp3")
      scoped = sort(scoped,:number)
    elsif (params[:commit] == "SearchDown3")
      scoped = sort(scoped,:age,:desc)
    end
    scoped
  end

  private def search(scoped, query = nil)
    (query != nil and query != "") ? scoped.where("name LIKE '%#{query}%'") : scoped
  end
  private def searchByAge(scoped, query = nil)
    (query != nil and query != "") ? scoped.where("age = #{query}") : scoped
  end
  private def searchByNumber(scoped, query = nil)
    (query != nil and query != "") ? scoped.where("number LIKE '%#{query}%'") : scoped
  end
  private def sort(scoped, sort_type = :name, sort_direction = :asc)
    scoped.order(sort_type => sort_direction)
  end

  private def sort_by_otdelenies(scoped)
    scoped.sort_by(&:count_otdelenies)
  end

  private def sort_by_doctors(scoped, sort_direction = "ASC")
    scoped.sort_by(&:count_doctors)
  end

end
