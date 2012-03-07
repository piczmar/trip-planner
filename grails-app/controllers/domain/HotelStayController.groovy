package domain

class HotelStayController {
  def scaffold = HotelStay
  def near = {
	  // create dummy JSON
	  def txt = "{\"ResultSet\": {\"totalResultsReturned\": 2, \"Result\": [{\"Title\": \"Nemea\", \"Distance\": \"10\" },{\"Title\": \"Grand Hotel\", \"Distance\": \"120\" }] }}"
	  render(contentType:"application/json", text: txt)
  }
}
