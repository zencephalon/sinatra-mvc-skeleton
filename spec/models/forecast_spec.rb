describe Forecast do
  let (:forecast){
    Forecast.new({country: "Bulgaria"})
  }
  let (:forecast) {
    Forecast.create({
      city: "Sofia",
      country: "Bulgaria",
      user_id: 1

      })}
  describe "has attributes" do
    it "has a city" do
      expect(forecast.city == "Sofia").to be_truthy
    end
    it "has a country" do
      expect(forecast.country == "Bulgaria").to be_truthy
    end
  end
end
