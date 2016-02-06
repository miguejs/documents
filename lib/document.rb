class Document

  attr_accessor :id, :title, :tags, :description

  def initialize(params = {})
    @id = params[:id]
    @title = params[:title]
    @tags = params[:tags]
    @description = params[:description]
  end

  def save
    DB[:documents].insert(
      title: @title,
      tags: @tags,
      description: @description
    )
  end

  def self.all
    DB[:documents].all.map do |row|
    document =  new(
        title:        row[:title],
        tags:         row[:tags],
        description:  row[:description],
        id:           row[:id]
      )
    document
    end
  end
  def self.find(id)
    Document.new DB[:documents].where(id =id).first
  end
end
