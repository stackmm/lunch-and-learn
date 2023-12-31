require "rails_helper"

RSpec.describe Recipe do
  before(:each) do
    @recipe = Recipe.new({
      "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_3a551652abf5a1cef1421660d1b657d9",
      "label": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
      "image": "https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQDe6jttpppSr%2F4i6QTadMib2If6KnsDiTWZT7VKoyY8RQIhAL3%2FZblcuu0u1GOyGTFGsynmiR6DKXXpcoEfTMbxCKdKKrkFCDcQABoMMTg3MDE3MTUwOTg2IgyHdRoeknjyvIqZEBIqlgW%2F6%2F6AzzqinqClEfDIlHIVS%2FK8XGrCtoEJB1pmqou8D8p2maedIRjKdMPY43H3A3DxYr0frkPc49ssJV7u7cUAhZJfoSRRjiLp7pjGTDeGQ%2Fx7zTnxTtxZYBeM5nPik5tHk4eIGsdvTYx%2Fp73cEsEgMdPBn1qjI1vbbuVFO%2BwGRHO2QPRVWagMvL3f9msGLmkWTdrrlqVpzDOwcK9yMsxDdSKhsWXIzHEbwm2mh4RXG691pWqDNrkJA6VRrjCrDY6RNWKI879pnfMmKeLvtd%2FVF5kWcebhH8Ys%2BdOgATG4BgNTJefGVhjgpMhaT91G0GpmUMJZ5KuRuPb8yZKFdt29FwVO%2B0WiXSrovsaQ6yltlYwSkJZa06qt3zKTdc9XZ%2FjAIq3G1nwN%2BxJ9DcBJ4smJSstsa%2BjRKPOwjHIq9nwlWKgJmwepQHd%2Fqz99C%2FjCeGcyK61L584ymM40YcnuzmTaGWXucRpucI0NnIpOrTviIWuK6vVKUBZ2aQUMFyG%2BDljJvpLomznwl1IbzM9Nk0Eu54kmxGy9qtUF1apOs%2BF5D%2FezPj5NLRL2EES82OeorzRumMBGOcgK%2FYODEt%2BVzwcgdDysQM651TNhSK2KwpcinZ4spGGVewk0WqwGnFkxyE%2BrmgV8B13pV26lQ%2FP5eQ9Xh9dhc1dx0vzOT0fFAtikgNdnlUVm0KV%2FZ92EKL6k2Af%2F95Wrcdrdzfu0YXzYhvqnbBNITxIfM09hWVuor4uHWoDqU%2FOPCU0z8lVETTNTByMLm5L%2BwZM25DXWE%2BDPaqjp492jcfiee7ZPljZTRWDa5lKGbh94zk%2FBJ8EsuQKmf%2F8Gqnez3myRGsGdldv1KfPU%2B%2FU6W1zGxJL4V8nkYeLKKJ90eJhTxDDp5rWmBjqwAdSsDhtqMlyBTBjQ9ssUaKzVIRB8zgTLsa7Jpus45Z%2B5XbBMIqTIK2RmfW48sLAGei5KtP%2B5Z5KL8Kmkpvb%2Fbnrbg7yC6ehAF0MpMRqlTe9aDJopvbUVv0FJ%2Bk%2BeLWDIJoG0wCvhY0eFQ2ezssvENh8314bLY2EhwIeJEX47aPPPrjAbqkNoJ9b85Dl9PcYWzUzed5LckfY5gLPpHBMj%2FlMU5FKON7JoEwRB7zwt2lDK&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230804T230015Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFMLLAKUWC%2F20230804%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=ef45e3f5499d4eb3b8aeebd5e918aae51520d21673a1f94c6289618b62e36575",
      "url": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
      "country": "thailand"
    })
  end

  it "exists" do
    expect(@recipe).to be_a(Recipe)
  end

  it "has attributes" do
    expect(@recipe.id).to eq(nil)
    expect(@recipe.title).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
    expect(@recipe.url).to eq("https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html")
    expect(@recipe.country).to eq("thailand")
    expect(@recipe.image).to eq("https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQDe6jttpppSr%2F4i6QTadMib2If6KnsDiTWZT7VKoyY8RQIhAL3%2FZblcuu0u1GOyGTFGsynmiR6DKXXpcoEfTMbxCKdKKrkFCDcQABoMMTg3MDE3MTUwOTg2IgyHdRoeknjyvIqZEBIqlgW%2F6%2F6AzzqinqClEfDIlHIVS%2FK8XGrCtoEJB1pmqou8D8p2maedIRjKdMPY43H3A3DxYr0frkPc49ssJV7u7cUAhZJfoSRRjiLp7pjGTDeGQ%2Fx7zTnxTtxZYBeM5nPik5tHk4eIGsdvTYx%2Fp73cEsEgMdPBn1qjI1vbbuVFO%2BwGRHO2QPRVWagMvL3f9msGLmkWTdrrlqVpzDOwcK9yMsxDdSKhsWXIzHEbwm2mh4RXG691pWqDNrkJA6VRrjCrDY6RNWKI879pnfMmKeLvtd%2FVF5kWcebhH8Ys%2BdOgATG4BgNTJefGVhjgpMhaT91G0GpmUMJZ5KuRuPb8yZKFdt29FwVO%2B0WiXSrovsaQ6yltlYwSkJZa06qt3zKTdc9XZ%2FjAIq3G1nwN%2BxJ9DcBJ4smJSstsa%2BjRKPOwjHIq9nwlWKgJmwepQHd%2Fqz99C%2FjCeGcyK61L584ymM40YcnuzmTaGWXucRpucI0NnIpOrTviIWuK6vVKUBZ2aQUMFyG%2BDljJvpLomznwl1IbzM9Nk0Eu54kmxGy9qtUF1apOs%2BF5D%2FezPj5NLRL2EES82OeorzRumMBGOcgK%2FYODEt%2BVzwcgdDysQM651TNhSK2KwpcinZ4spGGVewk0WqwGnFkxyE%2BrmgV8B13pV26lQ%2FP5eQ9Xh9dhc1dx0vzOT0fFAtikgNdnlUVm0KV%2FZ92EKL6k2Af%2F95Wrcdrdzfu0YXzYhvqnbBNITxIfM09hWVuor4uHWoDqU%2FOPCU0z8lVETTNTByMLm5L%2BwZM25DXWE%2BDPaqjp492jcfiee7ZPljZTRWDa5lKGbh94zk%2FBJ8EsuQKmf%2F8Gqnez3myRGsGdldv1KfPU%2B%2FU6W1zGxJL4V8nkYeLKKJ90eJhTxDDp5rWmBjqwAdSsDhtqMlyBTBjQ9ssUaKzVIRB8zgTLsa7Jpus45Z%2B5XbBMIqTIK2RmfW48sLAGei5KtP%2B5Z5KL8Kmkpvb%2Fbnrbg7yC6ehAF0MpMRqlTe9aDJopvbUVv0FJ%2Bk%2BeLWDIJoG0wCvhY0eFQ2ezssvENh8314bLY2EhwIeJEX47aPPPrjAbqkNoJ9b85Dl9PcYWzUzed5LckfY5gLPpHBMj%2FlMU5FKON7JoEwRB7zwt2lDK&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230804T230015Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFMLLAKUWC%2F20230804%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=ef45e3f5499d4eb3b8aeebd5e918aae51520d21673a1f94c6289618b62e36575")
  end
end