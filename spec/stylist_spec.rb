require('spec_helper')

  describe(Stylist) do
    describe(".all") do
      it("starts off with no stylists") do
        expect(Stylist.all()).to(eq([]))
      end
    end

  describe("#name") do
    it("tells you the stylists name") do
      stylist = Stylist.new({:name => "Debbie Hairy", :id => nil})
      expect(stylist.name()).to(eq("Debbie Hairy"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      list = List.new({:name => "Epicodus Stuff", :id => nil})
      list.save()
      expect(list.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save stylists to the database") do
      stylist = Stylist.new({:name => "Debbie Hairy", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe("#==") do
    it("returns the same stylist if it has the same name") do
      stylist1 = Stylist.new({:name => "Debbie Hairy", :id => nil})
      stylist2 = Stylist.new({:name => "Debbie Hairy", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe(".find") do
    it("returns a stylist by it's ID") do
      test_stylist = Stylist.new({:name => "Debbie Hairy", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Sean Combs", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe("#clients") do
    it("returns an array of clients for that stylist") do
      test_stylist = Stylist.new({:name => "Debbie Hairy", :id => nil})
      test_stylist.save()
      test_client = Client.new({:name => "Elle Woods", :stylist_id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:name => "Ruby Woods", :stylist_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end
end
