describe MoviesController do
  describe 'lookup movies with same director' do
    it 'should call the model method that lookup for similar movies' do
      expect(Movie).to receive(:similars).and_return()
      #get :
    end
    
    it 'should select the Similar Movies template for rendering'
    it 'should make the method lookup results available to that template'
  end
end