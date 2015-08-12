class ResourcesController < ApplicationController
  def index
    @resources = ['Resource 1', 'Resource 2', 'Resource 3']
  end
end
