Possible logins:
|Email|Senha|
| -- | -- |
| <joao@example.com>| 123123 |
| <marcio@example.com> |123123 |
| <fabio@example.com>| 123123 |

Run `rails db:migrate && rails:db:seed` before start

## Instruções

Você está desenvolvendo uma aplicação para um software de laboratório de hospital onde os médicos podem fazer criar/atualizar exames e pacientes podem ver. Ninguém pode deletar.

## Modelos

### User

- nome
- email
- phone_number
- avatar (imagem)
- senha

### Hospital

- nome

### UserHospital

- user_id
- hospital_id
- role
- Exame: doctor_id, patient_id, description

## Regras

- A ideia é que um hospital tenha vários usuários (através da Join Table UserHospital) que podem ser pacientes ou médicos.
- Um exame é apenas uma descrição atrelada a um médico e um paciente.
- Médicos podem ver todos os exames, pacientes só podem ver os seus exames.
- Telefones devem ser normalizados em E.164

A ideia é que você desenvolva um CRUD básico com autenticação (Devise) e testes levando em conta essas restrições de permissão dependendo do role usuário.
