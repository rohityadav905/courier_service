class Parcel < ApplicationRecord

	STATUS = ['Sent', 'In Transit', 'Delivered']
	PAYMENT_MODE = ['COD', 'Prepaid']

	validates :weight, :status, presence: true
	validates :status, inclusion: STATUS
	validates :payment_mode, inclusion: PAYMENT_MODE
  validates :cost, :weight, numericality: {:message => "Accepts only numric Values"}


	belongs_to :service_type
	belongs_to :sender, class_name: 'User'
	belongs_to :receiver, class_name: 'User'

	after_create :send_notification
	before_save :send_status_change_email,  if: -> { status_changed? }

	def send_status_change_email
		if status != "Sent"
			@recipients = [self.sender.email, self.receiver.email]
			@recipients.each do |email|
			  UserMailer.status_changed(self, email).deliver
			end
		end
	end

	def generate_parcel_report
    attributes = %w{id sender receiver}
	  parcels = Parcel.where(created_at: Date.today)

    CSV.generate(headers: true) do |csv|
      csv << attributes

      parcels.each do |parcel|
        csv << attributes.map{ |attr| parcel.send(attr) }
      end
    end
	end

	private

	def send_notification
		UserMailer.with(parcel: self).status_email.deliver_now
	end


end
