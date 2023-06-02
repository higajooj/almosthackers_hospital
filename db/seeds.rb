lagmc = Hospital.create(name: "Los Angeles General Medical Center")
hca = Hospital.create(name: "HCA Healthcare")
vha = Hospital.create(name: "Veterans Health Administration")

pw = "123123"

joao = User.create(email: "joao@example.com", name: "Joao", phone_number: "+5511912345678", password: pw, password_confirmation: pw)
pedro = User.create(email: "pedro@example.com", name: "Pedro", phone_number: "+5511912348888", password: pw, password_confirmation: pw)
marcio = User.create(email: "marcio@example.com", name: "Marcio", phone_number: "+5511912347777", password: pw, password_confirmation: pw)
paulo = User.create(email: "paulo@example.com", name: "Paulo", phone_number: "+5511912346666", password: pw, password_confirmation: pw)
fabio = User.create(email: "fabio@example.com", name: "Fabio", phone_number: "+5511912345555", password: pw, password_confirmation: pw)

a1 = HospitalUserAssociation.create(hospital: lagmc, user: joao, role: "pacient")
a2 = HospitalUserAssociation.create(hospital: lagmc, user: pedro, role: "pacient")
a3 = HospitalUserAssociation.create(hospital: lagmc, user: marcio, role: "pacient")
a4 = HospitalUserAssociation.create(hospital: lagmc, user: paulo, role: "doctor")
a5 = HospitalUserAssociation.create(hospital: lagmc, user: fabio, role: "doctor")

a6 = HospitalUserAssociation.create(hospital: hca, user: joao, role: "pacient")
a7 = HospitalUserAssociation.create(hospital: hca, user: pedro, role: "doctor")

a8 = HospitalUserAssociation.create(hospital: vha, user: joao, role: "pacient")
a9 = HospitalUserAssociation.create(hospital: vha, user: marcio, role: "doctor")

