require 'rails_helper'

RSpec.describe "Devices", :type => :request do
  describe "GET /devices" do
    it "works! (now write some real specs)" do
      skip('build valid requests')
      get devices_path
      expect(response).to have_http_status(200)
    end
  end
end