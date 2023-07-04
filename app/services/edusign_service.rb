require 'faraday'
require 'json'

class EdusignService

  BASE_URL = 'https://ext.edusign.fr'.freeze

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
    response = connection.get("#{BASE_URL}/v1/professor?page=0", nil)

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
    response = connection.get("#{BASE_URL}/v1/professor/get-id/#{formatik_professor_id}", nil)
    professor_id = JSON.parse(response.body)['result']['ID']
    response = connection.get("#{BASE_URL}/v1/professor/#{professor_id}", nil)

    if response.success?
      JSON.parse(response.body)['result']
    else
      error_message = JSON.parse(response.body)['message']
      raise "Failed to get professor. Error: #{error_message}"
    end

  end

  def add_professor(intervenant) # ----------------------Ajoute un professeur
    payload = {
      "professor" => {
        "FIRSTNAME" => intervenant.prenom,
        "LASTNAME" => intervenant.nom,
        "EMAIL" => intervenant.email,
        "SPECIALITY" => "Tech",
        "API_ID" => intervenant.id,
        "TAGS" => ["tag 1", "tag 2"]
      },
      "dontSendCredentials" => false
    }

    response = connection.post("#{BASE_URL}/v1/professor", payload.to_json)

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

  def add_student(apprenant) # ---Ajoute un étudiant
    payload = {
      "student" => {
        "FIRSTNAME" => apprenant.prenom,
        "LASTNAME" => apprenant.nom,
        "EMAIL" => apprenant.email,
        "PHONE" => apprenant.telephone,
        "COMPANY" => apprenant.entreprise.nom,
        "API_ID" => apprenant.id,
        "TAGS" => ["tag 1", "tag 2"],
        "SEND_EMAIL_CREDENTIALS" => false
      }
    }

    response = connection.post("#{BASE_URL}/v1/student", payload.to_json)

    if response.success?
      JSON.parse(response.body)['result']
    else
      error_message = JSON.parse(response.body)['message']
      raise "Failed to add student. Error: #{error_message}"
    end
  end

  def get_a_student(formatik_student_id) # -------------------------------------------------Récupère un étudiant
    response = connection.get("#{BASE_URL}/v1/student/get-id/#{formatik_student_id}", nil)
    student_id = JSON.parse(response.body)['result']['ID']
    response = connection.get("#{BASE_URL}/v1/student/#{student_id}", nil)

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

    response = connection.post("#{BASE_URL}/v1/group", payload.to_json)

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

  def create_course(session, intervenant, apprenants) # Crée un cours
    payload = {
      "course" => {
        "NAME" => session.nom,
        "DESCRIPTION" => session.programme.description,
        "START" => session.date_debut,
        "END" => session.date_fin,
        "PROFESSOR" => get_a_professor(intervenant.id)["ID"],
        "SCHOOL_GROUP" => create_group(session.nom, apprenants)["ID"]
      }
    }


    response = connection.post("#{BASE_URL}/v1/course", payload.to_json)

    if response.success?
      puts "Course added successfully"
    else
      error_message = JSON.parse(response.body)['message']
      raise "Failed to add course. Error: #{error_message}"
    end
  end

  # ====================================================================================================================
  # ------------------------------------------------------DOCUMENTS-----------------------------------------------------
  # ====================================================================================================================

  def get_documents
    response = connection.get("#{BASE_URL}/v2/documents/templates", nil)

    if response.success?
      JSON.parse(response.body)
    else
      response.status
      response.body
      error_message = JSON.parse(response.body)['message']
      raise "Failed to get documents. Error: #{error_message}"
    end
  end
end
