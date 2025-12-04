import time
import datetime

# Subsystem 1: Data Fetcher
class DataFetcher:
    def fetch_sales_data(self, start_date, end_date):
        print(f"DataFetcher: Fetching sales data from {start_date} to {end_date}...")
        time.sleep(0.5) # Simulate network delay
        return [{"product": "Laptop", "sales": 100}, {"product": "Mouse", "sales": 250}]

    def fetch_inventory_data(self):
        print("DataFetcher: Fetching inventory data...")
        time.sleep(0.3)
        return [{"item": "Laptop", "stock": 50}, {"item": "Keyboard", "stock": 150}]

# Subsystem 2: Data Processor
class DataProcessor:
    def aggregate_sales(self, raw_data):
        print("DataProcessor: Aggregating sales data...")
        total_sales = sum(item["sales"] for item in raw_data)
        return {"total_sales": total_sales, "items": raw_data}

    def calculate_stock_value(self, inventory_data, prices):
        print("DataProcessor: Calculating inventory value...")
        total_value = sum(item["stock"] * prices.get(item["item"], 0) for item in inventory_data)
        return {"total_stock_value": total_value, "items": inventory_data}

# Subsystem 3: Report Formatter
class ReportFormatter:
    def format_sales_report(self, processed_data):
        print("ReportFormatter: Formatting sales report...")
        report_str = f"Sales Report ({datetime.date.today()}):\n"
        report_str += f"Total Sales: ${processed_data['total_sales']}\n"
        for item in processed_data['items']:
            report_str += f"  - {item['product']}: {item['sales']} units\n"
        return report_str

    def format_inventory_report(self, processed_data):
        print("ReportFormatter: Formatting inventory report...")
        report_str = f"Inventory Report ({datetime.date.today()}):\n"
        report_str += f"Total Inventory Value: ${processed_data['total_stock_value']:.2f}\n"
        for item in processed_data['items']:
            report_str += f"  - {item['item']}: {item['stock']} units\n"
        return report_str

# Subsystem 4: Notification Service
class NotificationService:
    def send_email(self, recipient, subject, body):
        print(f"NotificationService: Sending email to {recipient} with subject '{subject}'")
        # In a real app, this would integrate with an email API
        print(f"Email Body:\n---\n{body}\n---")
        time.sleep(0.1)

# Facade Class
class ReportGenerationFacade:
    def __init__(self):
        self.data_fetcher = DataFetcher()
        self.data_processor = DataProcessor()
        self.report_formatter = ReportFormatter()
        self.notification_service = NotificationService()
        self.product_prices = {"Laptop": 1200, "Mouse": 25, "Keyboard": 75} # Sample prices

    def generate_and_send_daily_sales_report(self, recipient_email):
        print("\n--- Initiating Daily Sales Report Generation ---")
        today = datetime.date.today()
        yesterday = today - datetime.timedelta(days=1)
        
        # 1. Fetch data
        raw_sales = self.data_fetcher.fetch_sales_data(yesterday, today)
        
        # 2. Process data
        processed_sales = self.data_processor.aggregate_sales(raw_sales)
        
        # 3. Format report
        sales_report_content = self.report_formatter.format_sales_report(processed_sales)
        
        # 4. Send notification
        self.notification_service.send_email(
            recipient_email,
            f"Daily Sales Report - {today}",
            sales_report_content
        )
        print("--- Daily Sales Report Process Completed ---")

    def generate_and_check_inventory_value(self):
        print("\n--- Initiating Inventory Value Check ---")
        # 1. Fetch data
        inventory_data = self.data_fetcher.fetch_inventory_data()
        
        # 2. Process data
        calculated_value = self.data_processor.calculate_stock_value(inventory_data, self.product_prices)
        
        # 3. Format report (optional, can just return value)
        inventory_report_content = self.report_formatter.format_inventory_report(calculated_value)

        print(inventory_report_content)
        print(f"Current Total Inventory Value: ${calculated_value['total_stock_value']:.2f}")
        print("--- Inventory Value Check Completed ---")
        return calculated_value['total_stock_value']

# Client Code
if __name__ == "__main__":
    report_system = ReportGenerationFacade()

    # Client uses the facade to perform a complex task simply
    report_system.generate_and_send_daily_sales_report("manager@example.com")

    # Another complex task via the facade
    current_inventory_value = report_system.generate_and_check_inventory_value()
    print(f"\nFinal Check: Inventory value reported as ${current_inventory_value:.2f}")