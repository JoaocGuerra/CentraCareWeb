class EmployeeModel{

  late String cpf, data_nascimento, genero, nome, sobrenome;
  String? especialidade;

  EmployeeModel(this.cpf, this.data_nascimento, this.genero, this.nome, this.sobrenome, [this.especialidade]);
}