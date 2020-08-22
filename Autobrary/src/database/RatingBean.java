package database;

public class RatingBean {
	private String book_id;
	private String all_score;
	private String count;
	private String rating;
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public String getAll_score() {
		return all_score;
	}
	public void setAll_score(String all_score) {
		this.all_score = all_score;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
}
