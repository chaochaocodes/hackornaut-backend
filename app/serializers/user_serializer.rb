class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_emails, :user_breaches

  def user_emails
    self.object.emails.map do |email|
      { address: email.address,
        breaches: email.breaches.map do |breach|
          breach
        end
      }
    end
  end

  def user_breaches
    ub = []
    self.object.emails.each do |email|
      email.breaches.each_with_object(ub) do |breach, ub|
        user_has_breach = false
        ub.each do |ele|
          if ele[:name] == breach.name
            ele[:emails] << email.address
            user_has_breach = true
          end
        end
        ub << { breach: breach, emails: [email.address]} unless user_has_breach == true
      end
    end
    ub
  end
end
