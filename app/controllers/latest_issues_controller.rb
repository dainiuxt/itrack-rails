class LatestIssuesController < ApplicationController
  def index
    @issues = Issue.all
  end
end
