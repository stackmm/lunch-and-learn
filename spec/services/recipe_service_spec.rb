require "rails_helper"

RSpec.describe RecipeService do
  it "establishes a connection and obtains recipes by country", :vcr do
    recipes = RecipeService.get_recipes_by_country("thailand")

    expect(recipes).to be_a(Hash)
    expect(recipes[:count]).to eq(191)
    expect(recipes[:hits]).to be_a(Array)
    expect(recipes[:hits][0][:recipe][:label]).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
    expect(recipes[:hits][0][:recipe][:image]).to eq("https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQD76IfqB6tXYimUVBvMXooLmZjUbshZL3BMnIsjNpYtbwIhAIsXXJ1u0feIrZfKPp8ZKAWweMMqtp%2F9X1nHZst%2FqLE7KrkFCEoQABoMMTg3MDE3MTUwOTg2IgzqsIfKBCc851ioCkIqlgXiRXgXvbMmaTxQ0rBpIYua39DdVmnDGGb%2BouKEHk35EfiZrzH%2FwledU4i2uWhcnFSO69J4aHwPF1Bz5kEJm2N3knMux51DCJmm3oMcUbKwqoNhdGU2jfFWpgm2iNHHcJXgDL%2FuWN7f4mWxlPBOdts38A2LJ4tiwbJVH9QNrb9QCPlB90CEEYyGVm%2Fqi8A%2BTPeFLD0GSoEnT8V7oZvfTUvvssNDmboZAIxxtF0ZzOsMxMDwJpmB74pkYVWKzMrIV%2Btij%2BOqdr%2F8eL4nU9wVxSwLjqaxlj5pmO4sVtEHWDz6VyC9ePBReZepLhuhTreAFY9sT5oksCJxBBow3l%2B2nOeM5PmAs0loLgU014Msx0KYagpDNQ%2FFtrvy3ypRxIBSkQ1GCZHLrmfZEb3KY5AQwzZhWbii2%2Fdhn4Cfs79kHjonKGzbAT2lqIPDZQ3fF7SzxLlhlfu%2BTF%2FxUegVWn0YNB6YFhcHoAp%2BqEfVoto%2FZ56u%2B8xdEKizok3LgWJy4JRYJIYqvMIQniUu4%2BKpynya5SvLaxfawAdqkg0XjNmIlEL0%2Fvr%2BepYwQqfHQRDblPeRHotDaflYPZU1hdl%2Bc9gNp9JJk05vsA1k3gygZe7ZhkdaMRcoF05SUXRFur62idqh1f1FHdh8wFORWlGYQn823CbZf%2FA5l43iH9Fj%2BWbCMQvRMrJDCo2CXH2eyIHsvbHXykIrFMgJ2HFun9XzyAtdtEe%2BJChQyqv%2FpwAuhmUvcTDGmM4vGQc7LUN1YZpqCHdwkrqrh1gUSvBm5d5V952Qx8IshmGMT1jqeHV5MqPkwhw7oErTRQrsMmOjxCW0sr77KauBM0mNZrvf3STW%2B6YXUdGMr%2FoueZIDsfa1STjT52V1kwjq206ZoDCi%2B7mmBjqwAR2kxLnJrELMAKFQXvmua6BYyTLzRQJmgpASMEFKrLqNjEZVRzvnUCWt2G2eQAk5TTWDy4DAL2vpNf1rGmBMjKnfHx7K2d%2BqDhH8bRTNropY2DLRUocpkswIh9L0EfuesBrj11hAHzTynUiQZtcgdbgCKA%2BKcHYU6typmjmxNMpjhSsSCgrfb%2FVTwtS9M6CXQsrQmu26TsyK9BZPUWSTL0GlH4RovnKXaCMp5PV97ggJ&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230805T180712Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFISHVWGFX%2F20230805%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=71e171cb064b212cd4278449e7c2ece85de2a21c85b651b2137345ee5948f636")
    expect(recipes[:hits][0][:recipe][:url]).to eq("https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html")
  end
end