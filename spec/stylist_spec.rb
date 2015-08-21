require('spec_helper')

describe('Stylist') do
  
  describe('.all') do
    it('starts off with no stylists') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#name') do
    it('retuns the name of a stylist') do
      test_stylist = Stylist.new({:name => 'Debbie Hairy'})
      expect(test_stylist.name()).to(eq('Debbie Hairy'))
  end
 end

end
