require 'rails_helper'

RSpec.describe Episode, :type => :model do

    before(:each) do
        @season = Season.create(title: "Test", plot: "Test", number: 1)
      end

    it "is not valid without valid attributes" do
        expect(Episode.new).not_to be_valid
    end
    
    it "is valid with valid attributes" do
        expect(Episode.create(title: "Test", plot: "Test", number: 1, season_id: @season.id )).to be_valid
    end

    it "is not valid without a title" do
        expect(Episode.create(title: nil, plot: "Test", number: 1, season_id: @season.id)).not_to be_valid
    end

    it "is not valid without a plot" do
        expect(Episode.create(title: "Test", plot: nil, number: 1, season_id: @season.id)).not_to be_valid
    end

    it "is not valid without a number" do
        expect(Episode.create(title: "Test", plot: "Test", number: nil, season_id: @season.id)).not_to be_valid
    end

    it "is not valid without a season" do
        expect(Episode.create(title: "Test", plot: "Test", number: 1, season_id: nil )).not_to be_valid
    end
end