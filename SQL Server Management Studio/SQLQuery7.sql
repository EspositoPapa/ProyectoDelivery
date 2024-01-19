SELECT
	SUBSTRING(CRM.[Delivery_Transaction_ID],4,LEN([Delivery_Transaction_ID]))
from
	CRM