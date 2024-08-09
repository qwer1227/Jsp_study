package vo;

public class ProductBenefit {

	private int productNo;
	private int benefitNo;
	
	public ProductBenefit() {}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getBenefitNo() {
		return benefitNo;
	}

	public void setBenefitNo(int benefitNo) {
		this.benefitNo = benefitNo;
	}

	@Override
	public String toString() {
		return "ProductBenefit [productNo=" + productNo + ", benefitNo=" + benefitNo + "]";
	}
	
	
}
