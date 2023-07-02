require 'faraday'
require 'json'

class EdusignService

  BASE_URL = 'https://ext.edusign.fr/v1'.freeze

  def connection # -----------------------------------------------------------------------Connexion à l'API
    Faraday.new(url: BASE_URL) do |faraday|
      faraday.headers['Authorization'] = "Bearer 386258a2b62b975ad56363f6375c42ffc60d46a5e08d9e738844cbbcaa18bb5e"
      faraday.headers['Content-Type'] = 'application/json'
      faraday.adapter Faraday.default_adapter
    end
  end

  # ====================================================================================================================
  # -----------------------------------------------------PROFESSORS-----------------------------------------------------
  # ====================================================================================================================

  def get_professors # --------------------------------------------------------------------Récupère tous les professeurs
    response = connection.get("#{BASE_URL}/professor?page=0", nil)

    if response.success?
      JSON.parse(response.body)['result']
    else
      response.status
      response.body
      error_message = JSON.parse(response.body)['message']
      raise "Failed to get professors. Error: #{error_message}"
    end
  end

  def get_a_professor(formatik_professor_id) # --------------------------------------------Récupère un professeur
    response = connection.get("#{BASE_URL}/professor/get-id/#{formatik_professor_id}", nil)
    professor_id = JSON.parse(response.body)['result']['ID']
    response = connection.get("#{BASE_URL}/professor/#{professor_id}", nil)

    if response.success?
      JSON.parse(response.body)['result']
    else
      error_message = JSON.parse(response.body)['message']
      raise "Failed to get professor. Error: #{error_message}"
    end

  end

  def add_professor(prenom, nom, email, intervenant_id, tags = []) # ----------------------Ajoute un professeur
    payload = {
      "professor" => {
        "FIRSTNAME" => prenom,
        "LASTNAME" => nom,
        "EMAIL" => email,
        "SPECIALITY" => "Tech",
        "API_ID" => intervenant_id,
        "TAGS" => ["tag 1", "tag 2"]
      },
      "dontSendCredentials" => false
    }

    response = connection.post("#{BASE_URL}/professor", payload.to_json)

    if response.success?
      JSON.parse(response.body)['return']
    else
      error_message = JSON.parse(response.body)['message']
      raise "Failed to add professor. Error: #{error_message}"
    end
  end

  # ====================================================================================================================
  # ------------------------------------------------------STUDENTS------------------------------------------------------
  # ====================================================================================================================

  def add_student(prenom, nom, email, telephone, entreprise, apprenant_id, tags = []) # ---Ajoute un étudiant
    payload = {
      "student" => {
        "FIRSTNAME" => prenom,
        "LASTNAME" => nom,
        "EMAIL" => email,
        "PHONE" => telephone,
        "COMPANY" => entreprise,
        "API_ID" => apprenant_id,
        "TAGS" => ["tag 1", "tag 2"],
        "SEND_EMAIL_CREDENTIALS" => false
      }
    }

    response = connection.post("#{BASE_URL}/student", payload.to_json)

    if response.success?
      JSON.parse(response.body)['result']
    else
      error_message = JSON.parse(response.body)['message']
      raise "Failed to add student. Error: #{error_message}"
    end
  end

  def get_a_student(formatik_student_id) # -------------------------------------------------Récupère un étudiant
    response = connection.get("#{BASE_URL}/student/get-id/#{formatik_student_id}", nil)
    student_id = JSON.parse(response.body)['result']['ID']
    response = connection.get("#{BASE_URL}/student/#{student_id}", nil)

    if response.success?
      JSON.parse(response.body)['result']
    else
      error_message = JSON.parse(response.body)['message']
      raise "Failed to get student. Error: #{error_message}"
    end
  end

  # ====================================================================================================================
  # -------------------------------------------------------GROUPS-------------------------------------------------------
  # ====================================================================================================================

  def create_group(nom, apprenant_ids = []) # ---------------------------------------Crée un groupe(=liste d'apprenants)
    apprenant_ids = apprenant_ids.map do |apprenant|
      get_a_student(apprenant)["ID"]
    end

    payload = {
      "group" => {
        "NAME" => nom,
        "STUDENTS" => apprenant_ids
      }
    }

    response = connection.post("#{BASE_URL}/group", payload.to_json)

    if response.success?
      JSON.parse(response.body)['result']
    else
      error_message = JSON.parse(response.body)['message']
      raise "Failed to add group. Error: #{error_message}"
    end
  end

  # ====================================================================================================================
  # -------------------------------------------------------COURSES------------------------------------------------------
  # ====================================================================================================================

  def create_course(nom, description, date_debut, date_fin, intervenant_id, apprenant_ids = []) # Crée un cours
    payload = {
      "course" => {
        "NAME" => nom,
        "DESCRIPTION" => description,
        "START" => date_debut,
        "END" => date_fin,
        "PROFESSOR" => get_a_professor(intervenant_id)["ID"],
        "SCHOOL_GROUP" => create_group(nom, apprenant_ids)["ID"]
      }
    }

    response = connection.post("#{BASE_URL}/course", payload.to_json)

    if response.success?
      puts "Course added successfully"
    else
      error_message = JSON.parse(response.body)['message']
      raise "Failed to add course. Error: #{error_message}"
    end
  end
end















#   def get_professors
#     url = 'https://ext.edusign.fr/v1/professor?page=0'

#   headers = {
#     'Authorization' => 'Bearer 386258a2b62b975ad56363f6375c42ffc60d46a5e08d9e738844cbbcaa18bb5e',
#     'Content-Type' => 'application/json'
#   }

#   response = open(url, 'r', headers.to_s)
#   puts response
#   json_response = JSON.parse(response.read)

#   if response.status[0] == '200'
#     # Request was successful
#     professors = json_response['result']
#     professors.each do |professor|
#       puts "Name: #{professor['FIRSTNAME']} #{professor['LASTNAME']}"
#       puts "Email: #{professor['EMAIL']}"
#       puts "Speciality: #{professor['SPECIALITY']}"
#       puts "API ID: #{professor['API_ID']}"
#       puts "API Type: #{professor['API_TYPE']}"
#       puts "-" * 50
#     end
# else
#   # Request encountered an error
#   error_message = json_response['message']
#   puts "Error: #{error_message}"
# end
#   end
