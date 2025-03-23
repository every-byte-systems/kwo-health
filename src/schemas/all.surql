DEFINE TABLE code_system SCHEMAFULL PERMISSIONS FULL;
DEFINE FIELD id ON code_system TYPE string;
DEFINE FIELD url ON code_system TYPE string;
DEFINE FIELD version ON code_system TYPE string;
DEFINE FIELD name ON code_system TYPE string;
DEFINE FIELD title ON code_system TYPE string;
DEFINE FIELD status ON code_system TYPE string;
DEFINE FIELD experimental ON code_system TYPE bool;
DEFINE FIELD date ON code_system TYPE datetime;
DEFINE FIELD publisher ON code_system TYPE string;
DEFINE FIELD description ON code_system TYPE string;
DEFINE FIELD caseSensitive ON code_system TYPE bool;
DEFINE FIELD hierarchyMeaning ON code_system TYPE string;
DEFINE FIELD content ON code_system TYPE string;
DEFINE FIELD count ON code_system TYPE int;
DEFINE FIELD created_at ON code_system TYPE datetime DEFAULT time::now();
DEFINE FIELD updated_at ON code_system TYPE datetime DEFAULT time::now();

-- concept: Represents codes/concepts within a code system
DEFINE TABLE concept SCHEMAFULL PERMISSIONS FULL;
DEFINE FIELD code ON concept TYPE string;
DEFINE FIELD display ON concept TYPE string;
DEFINE FIELD definition ON concept TYPE string;
DEFINE FIELD system ON concept TYPE string;
DEFINE FIELD inactive ON concept TYPE bool DEFAULT false;
DEFINE FIELD created_at ON concept TYPE datetime DEFAULT time::now();
DEFINE FIELD updated_at ON concept TYPE datetime DEFAULT time::now();

-- value_set: Defines a set of codes from one or more code systems
DEFINE TABLE value_set SCHEMAFULL PERMISSIONS FULL;
DEFINE FIELD id ON value_set TYPE string;
DEFINE FIELD url ON value_set TYPE string;
DEFINE FIELD version ON value_set TYPE string;
DEFINE FIELD name ON value_set TYPE string;
DEFINE FIELD title ON value_set TYPE string;
DEFINE FIELD status ON value_set TYPE string;
DEFINE FIELD experimental ON value_set TYPE bool;
DEFINE FIELD date ON value_set TYPE datetime;
DEFINE FIELD publisher ON value_set TYPE string;
DEFINE FIELD description ON value_set TYPE string;
DEFINE FIELD immutable ON value_set TYPE bool;
DEFINE FIELD purpose ON value_set TYPE string;
DEFINE FIELD created_at ON value_set TYPE datetime DEFAULT time::now();
DEFINE FIELD updated_at ON value_set TYPE datetime DEFAULT time::now();

-- concept_map: Maps concepts from one value set to another
DEFINE TABLE concept_map SCHEMAFULL PERMISSIONS FULL;
DEFINE FIELD id ON concept_map TYPE string;
DEFINE FIELD url ON concept_map TYPE string;
DEFINE FIELD version ON concept_map TYPE string;
DEFINE FIELD name ON concept_map TYPE string;
DEFINE FIELD title ON concept_map TYPE string;
DEFINE FIELD status ON concept_map TYPE string;
DEFINE FIELD experimental ON concept_map TYPE bool;
DEFINE FIELD date ON concept_map TYPE datetime;
DEFINE FIELD publisher ON concept_map TYPE string;
DEFINE FIELD description ON concept_map TYPE string;
DEFINE FIELD purpose ON concept_map TYPE string;
DEFINE FIELD sourceUri ON concept_map TYPE string;
DEFINE FIELD targetUri ON concept_map TYPE string;
DEFINE FIELD created_at ON concept_map TYPE datetime DEFAULT time::now();
DEFINE FIELD updated_at ON concept_map TYPE datetime DEFAULT time::now();

-- naming_system: System to identify elements in other systems
DEFINE TABLE naming_system SCHEMAFULL PERMISSIONS FULL;
DEFINE FIELD id ON naming_system TYPE string;
DEFINE FIELD name ON naming_system TYPE string;
DEFINE FIELD status ON naming_system TYPE string;
DEFINE FIELD kind ON naming_system TYPE string;
DEFINE FIELD date ON naming_system TYPE datetime;
DEFINE FIELD publisher ON naming_system TYPE string;
DEFINE FIELD description ON naming_system TYPE string;
DEFINE FIELD usage ON naming_system TYPE string;
DEFINE FIELD created_at ON naming_system TYPE datetime DEFAULT time::now();
DEFINE FIELD updated_at ON naming_system TYPE datetime DEFAULT time::now();

-- patient: Represents a FHIR Patient resource
DEFINE TABLE patient SCHEMAFULL PERMISSIONS FULL;
DEFINE FIELD id ON patient TYPE string;
DEFINE FIELD identifier ON patient TYPE array;
DEFINE FIELD active ON patient TYPE bool;
DEFINE FIELD name ON patient TYPE array;
DEFINE FIELD telecom ON patient TYPE array;
DEFINE FIELD gender ON patient TYPE string;
DEFINE FIELD birthDate ON patient TYPE string;
DEFINE FIELD deceasedBoolean ON patient TYPE bool;
DEFINE FIELD deceasedDateTime ON patient TYPE string;
DEFINE FIELD address ON patient TYPE array;
DEFINE FIELD maritalStatus ON patient TYPE object;
DEFINE FIELD multipleBirthBoolean ON patient TYPE bool;
DEFINE FIELD multipleBirthInteger ON patient TYPE int;
DEFINE FIELD contact ON patient TYPE array;
DEFINE FIELD communication ON patient TYPE array;
DEFINE FIELD link ON patient TYPE array;
DEFINE FIELD extension ON patient TYPE array;
DEFINE FIELD created_at ON patient TYPE datetime DEFAULT time::now();
DEFINE FIELD updated_at ON patient TYPE datetime DEFAULT time::now();

-- organization: Represents a FHIR Organization resource
DEFINE TABLE organization SCHEMAFULL PERMISSIONS FULL;
DEFINE FIELD id ON organization TYPE string;
DEFINE FIELD identifier ON organization TYPE array;
DEFINE FIELD active ON organization TYPE bool;
DEFINE FIELD type ON organization TYPE array;
DEFINE FIELD name ON organization TYPE string;
DEFINE FIELD alias ON organization TYPE array;
DEFINE FIELD telecom ON organization TYPE array;
DEFINE FIELD address ON organization TYPE array;
DEFINE FIELD contact ON organization TYPE array;
DEFINE FIELD endpoint ON organization TYPE array;
DEFINE FIELD extension ON organization TYPE array;
DEFINE FIELD created_at ON organization TYPE datetime DEFAULT time::now();
DEFINE FIELD updated_at ON organization TYPE datetime DEFAULT time::now();

-- observation: Represents a FHIR Observation resource
DEFINE TABLE observation SCHEMAFULL PERMISSIONS FULL;
DEFINE FIELD id ON observation TYPE string;
DEFINE FIELD identifier ON observation TYPE array;
DEFINE FIELD basedOn ON observation TYPE array;
DEFINE FIELD partOf ON observation TYPE array;
DEFINE FIELD status ON observation TYPE string;
DEFINE FIELD category ON observation TYPE array;
DEFINE FIELD code ON observation TYPE object;
DEFINE FIELD encounter ON observation TYPE object;
DEFINE FIELD effectiveDateTime ON observation TYPE string;
DEFINE FIELD effectivePeriod ON observation TYPE object;
DEFINE FIELD effectiveInstant ON observation TYPE string;
DEFINE FIELD issued ON observation TYPE string;
DEFINE FIELD performer ON observation TYPE array;
DEFINE FIELD valueQuantity ON observation TYPE object;
DEFINE FIELD valueCodeableConcept ON observation TYPE object;
DEFINE FIELD valueString ON observation TYPE string;
DEFINE FIELD valueBoolean ON observation TYPE bool;
DEFINE FIELD valueInteger ON observation TYPE int;
DEFINE FIELD valueRange ON observation TYPE object;
DEFINE FIELD valueRatio ON observation TYPE object;
DEFINE FIELD valueSampledData ON observation TYPE object;
DEFINE FIELD valueTime ON observation TYPE string;
DEFINE FIELD valueDateTime ON observation TYPE string;
DEFINE FIELD valuePeriod ON observation TYPE object;
DEFINE FIELD dataAbsentReason ON observation TYPE object;
DEFINE FIELD interpretation ON observation TYPE array;
DEFINE FIELD note ON observation TYPE array;
DEFINE FIELD bodySite ON observation TYPE object;
DEFINE FIELD method ON observation TYPE object;
DEFINE FIELD specimen ON observation TYPE object;
DEFINE FIELD device ON observation TYPE object;
DEFINE FIELD referenceRange ON observation TYPE array;
DEFINE FIELD hasMember ON observation TYPE array;
DEFINE FIELD derivedFrom ON observation TYPE array;
DEFINE FIELD component ON observation TYPE array;
DEFINE FIELD extension ON observation TYPE array;
DEFINE FIELD created_at ON observation TYPE datetime DEFAULT time::now();
DEFINE FIELD updated_at ON observation TYPE datetime DEFAULT time::now();

-- condition: Represents a FHIR Condition resource
DEFINE TABLE condition SCHEMAFULL PERMISSIONS FULL;
DEFINE FIELD id ON condition TYPE string;
DEFINE FIELD identifier ON condition TYPE array;
DEFINE FIELD clinicalStatus ON condition TYPE object;
DEFINE FIELD verificationStatus ON condition TYPE object;
DEFINE FIELD category ON condition TYPE array;
DEFINE FIELD severity ON condition TYPE object;
DEFINE FIELD code ON condition TYPE object;
DEFINE FIELD bodySite ON condition TYPE array;
DEFINE FIELD encounter ON condition TYPE object;
DEFINE FIELD onsetDateTime ON condition TYPE string;
DEFINE FIELD onsetAge ON condition TYPE object;
DEFINE FIELD onsetPeriod ON condition TYPE object;
DEFINE FIELD onsetRange ON condition TYPE object;
DEFINE FIELD onsetString ON condition TYPE string;
DEFINE FIELD abatementDateTime ON condition TYPE string;
DEFINE FIELD abatementAge ON condition TYPE object;
DEFINE FIELD abatementPeriod ON condition TYPE object;
DEFINE FIELD abatementRange ON condition TYPE object;
DEFINE FIELD abatementString ON condition TYPE string;
DEFINE FIELD recordedDate ON condition TYPE string;
DEFINE FIELD recorder ON condition TYPE object;
DEFINE FIELD asserter ON condition TYPE object;
DEFINE FIELD stage ON condition TYPE array;
DEFINE FIELD evidence ON condition TYPE array;
DEFINE FIELD note ON condition TYPE array;
DEFINE FIELD extension ON condition TYPE array;
DEFINE FIELD created_at ON condition TYPE datetime DEFAULT time::now();
DEFINE FIELD updated_at ON condition TYPE datetime DEFAULT time::now();

-- medication: Represents a FHIR Medication resource
DEFINE TABLE medication SCHEMAFULL PERMISSIONS FULL;
DEFINE FIELD id ON medication TYPE string;
DEFINE FIELD identifier ON medication TYPE array;
DEFINE FIELD code ON medication TYPE object;
DEFINE FIELD status ON medication TYPE string;
DEFINE FIELD manufacturer ON medication TYPE object;
DEFINE FIELD form ON medication TYPE object;
DEFINE FIELD amount ON medication TYPE object;
DEFINE FIELD ingredient ON medication TYPE array;
DEFINE FIELD batch ON medication TYPE object;
DEFINE FIELD extension ON medication TYPE array;
DEFINE FIELD created_at ON medication TYPE datetime DEFAULT time::now();
DEFINE FIELD updated_at ON medication TYPE datetime DEFAULT time::now();

-- medication_request: Represents a FHIR MedicationRequest resource
DEFINE TABLE medication_request SCHEMAFULL PERMISSIONS FULL;
DEFINE FIELD id ON medication_request TYPE string;
DEFINE FIELD identifier ON medication_request TYPE array;
DEFINE FIELD status ON medication_request TYPE string;
DEFINE FIELD statusReason ON medication_request TYPE object;
DEFINE FIELD intent ON medication_request TYPE string;
DEFINE FIELD category ON medication_request TYPE array;
DEFINE FIELD priority ON medication_request TYPE string;
DEFINE FIELD doNotPerform ON medication_request TYPE bool;
DEFINE FIELD medicationCodeableConcept ON medication_request TYPE object;
DEFINE FIELD encounter ON medication_request TYPE object;
DEFINE FIELD supportingInformation ON medication_request TYPE array;
DEFINE FIELD authoredOn ON medication_request TYPE string;
DEFINE FIELD requester ON medication_request TYPE object;
DEFINE FIELD performer ON medication_request TYPE object;
DEFINE FIELD performerType ON medication_request TYPE object;
DEFINE FIELD recorder ON medication_request TYPE object;
DEFINE FIELD reasonCode ON medication_request TYPE array;
DEFINE FIELD basedOn ON medication_request TYPE array;
DEFINE FIELD groupIdentifier ON medication_request TYPE object;
DEFINE FIELD courseOfTherapyType ON medication_request TYPE object;
DEFINE FIELD insurance ON medication_request TYPE array;
DEFINE FIELD note ON medication_request TYPE array;
DEFINE FIELD dosageInstruction ON medication_request TYPE array;
DEFINE FIELD dispenseRequest ON medication_request TYPE object;
DEFINE FIELD substitution ON medication_request TYPE object;
DEFINE FIELD priorPrescription ON medication_request TYPE object;
DEFINE FIELD detectedIssue ON medication_request TYPE array;
DEFINE FIELD eventHistory ON medication_request TYPE array;
DEFINE FIELD extension ON medication_request TYPE array;
DEFINE FIELD created_at ON medication_request TYPE datetime DEFAULT time::now();
DEFINE FIELD updated_at ON medication_request TYPE datetime DEFAULT time::now();

-- extension: Represents FHIR Extensions as standalone resources
DEFINE TABLE extension SCHEMAFULL PERMISSIONS FULL;
DEFINE FIELD id ON extension TYPE string;
DEFINE FIELD url ON extension TYPE string;
DEFINE FIELD valueString ON extension TYPE string;
DEFINE FIELD valueInteger ON extension TYPE int;
DEFINE FIELD valueDecimal ON extension TYPE float;
DEFINE FIELD valueBoolean ON extension TYPE bool;
DEFINE FIELD valueCode ON extension TYPE string;
DEFINE FIELD valueDateTime ON extension TYPE string;
DEFINE FIELD valueReference ON extension TYPE object;
DEFINE FIELD valueQuantity ON extension TYPE object;
DEFINE FIELD valueCoding ON extension TYPE object;
DEFINE FIELD valueCodeableConcept ON extension TYPE object;
DEFINE FIELD extension ON extension TYPE array;
DEFINE FIELD created_at ON extension TYPE datetime DEFAULT time::now();
DEFINE FIELD updated_at ON extension TYPE datetime DEFAULT time::now();

-- structured_definition: Defines the structure of extensions
DEFINE TABLE structured_definition SCHEMAFULL PERMISSIONS FULL;
DEFINE FIELD id ON structured_definition TYPE string;
DEFINE FIELD url ON structured_definition TYPE string;
DEFINE FIELD version ON structured_definition TYPE string;
DEFINE FIELD name ON structured_definition TYPE string;
DEFINE FIELD title ON structured_definition TYPE string;
DEFINE FIELD status ON structured_definition TYPE string;
DEFINE FIELD experimental ON structured_definition TYPE bool;
DEFINE FIELD date ON structured_definition TYPE string;
DEFINE FIELD publisher ON structured_definition TYPE string;
DEFINE FIELD description ON structured_definition TYPE string;
DEFINE FIELD fhirVersion ON structured_definition TYPE string;
DEFINE FIELD kind ON structured_definition TYPE string;
DEFINE FIELD abstract ON structured_definition TYPE bool;
DEFINE FIELD type ON structured_definition TYPE string;
DEFINE FIELD baseDefinition ON structured_definition TYPE string;
DEFINE FIELD derivation ON structured_definition TYPE string;
DEFINE FIELD snapshot ON structured_definition TYPE object;
DEFINE FIELD differential ON structured_definition TYPE object;
DEFINE FIELD created_at ON structured_definition TYPE datetime DEFAULT time::now();
DEFINE FIELD updated_at ON structured_definition TYPE datetime DEFAULT time::now();

-- ============================================================================
-- GRAPH RELATIONSHIP DEFINITIONS
-- ============================================================================

-- belongs_to: Relates a concept to its code_system (concept -> code_system)
DEFINE TABLE belongs_to TYPE RELATION FROM concept TO code_system PERMISSIONS FULL;
DEFINE FIELD sort_weight ON belongs_to TYPE int DEFAULT 0;
DEFINE FIELD created_at ON belongs_to TYPE datetime DEFAULT time::now();

-- parent_of: Hierarchical relationship between concepts (parent concept -> child concept)
DEFINE TABLE parent_of TYPE RELATION FROM concept TO concept PERMISSIONS FULL;
DEFINE FIELD relationship_type ON parent_of TYPE string;
DEFINE FIELD created_at ON parent_of TYPE datetime DEFAULT time::now();

-- has_parent: Inverse relationship of parent_of (child concept -> parent concept)
DEFINE TABLE has_parent TYPE RELATION FROM concept TO concept PERMISSIONS FULL;
DEFINE FIELD relationship_type ON has_parent TYPE string;
DEFINE FIELD created_at ON has_parent TYPE datetime DEFAULT time::now();

-- includes: Relates a value_set to included concepts (value_set -> concept)
DEFINE TABLE includes TYPE RELATION FROM value_set TO concept PERMISSIONS FULL;
DEFINE FIELD valueSetVersion ON includes TYPE string;
DEFINE FIELD created_at ON includes TYPE datetime DEFAULT time::now();

-- included_in: Inverse relationship of includes (concept -> value_set)
DEFINE TABLE included_in TYPE RELATION FROM concept TO value_set PERMISSIONS FULL;
DEFINE FIELD valueSetVersion ON included_in TYPE string;
DEFINE FIELD created_at ON included_in TYPE datetime DEFAULT time::now();

-- maps_to: Relates source concept to target concept in a concept_map (source concept -> target concept)
DEFINE TABLE maps_to TYPE RELATION  FROM concept TO concept PERMISSIONS FULL;
DEFINE FIELD concept_map_id ON maps_to TYPE string;
DEFINE FIELD equivalence ON maps_to TYPE string;
DEFINE FIELD created_at ON maps_to TYPE datetime DEFAULT time::now();

-- mapped_from: Inverse relationship of maps_to (target concept -> source concept)
DEFINE TABLE mapped_from TYPE RELATION FROM concept TO concept PERMISSIONS FULL;
DEFINE FIELD concept_map_id ON mapped_from TYPE string;
DEFINE FIELD equivalence ON mapped_from TYPE string;
DEFINE FIELD created_at ON mapped_from TYPE datetime DEFAULT time::now();

-- contains_source: Relates a concept_map to its source value_set (concept_map -> value_set)
DEFINE TABLE contains_source TYPE RELATION FROM concept_map TO value_set PERMISSIONS FULL;
DEFINE FIELD created_at ON contains_source TYPE datetime DEFAULT time::now();

-- contains_target: Relates a concept_map to its target value_set (concept_map -> value_set)
DEFINE TABLE contains_target  TYPE RELATION FROM concept_map TO value_set PERMISSIONS FULL;
DEFINE FIELD created_at ON contains_target TYPE datetime DEFAULT time::now();

-- source_for: Inverse relationship of contains_source (value_set -> concept_map)
DEFINE TABLE source_for TYPE RELATION FROM value_set TO concept_map PERMISSIONS FULL;
DEFINE FIELD created_at ON source_for TYPE datetime DEFAULT time::now();

-- target_for: Inverse relationship of contains_target (value_set -> concept_map)
DEFINE TABLE target_for TYPE RELATION FROM value_set TO concept_map PERMISSIONS FULL;
DEFINE FIELD created_at ON target_for TYPE datetime DEFAULT time::now();

-- identifies: Relates a naming_system to a code_system (naming_system -> code_system)
DEFINE TABLE identifies TYPE RELATION FROM naming_system TO code_system PERMISSIONS FULL;
DEFINE FIELD identifierType ON identifies TYPE string;
DEFINE FIELD created_at ON identifies TYPE datetime DEFAULT time::now();

-- identified_by: Inverse relationship of identifies (code_system -> naming_system)
DEFINE TABLE identified_by TYPE RELATION FROM code_system TO naming_system PERMISSIONS FULL;
DEFINE FIELD identifierType ON identified_by TYPE string;
DEFINE FIELD created_at ON identified_by TYPE datetime DEFAULT time::now();

-- has_extension: Relates any resource to an extension
DEFINE TABLE has_extension TYPE RELATION  FROM any TO extension PERMISSIONS FULL;
DEFINE FIELD created_at ON has_extension TYPE datetime DEFAULT time::now();

-- defines_extension: Relates a structured definition to an extension
DEFINE TABLE defines_extension TYPE RELATION FROM structured_definition TO extension;
DEFINE FIELD created_at ON defines_extension TYPE datetime DEFAULT time::now();

-- has_condition_code: Relates a condition to its codeable concept (condition -> concept)
DEFINE TABLE has_condition_code TYPE RELATION FROM condition TO concept PERMISSIONS FULL;
DEFINE FIELD relationship_type ON has_condition_code TYPE string DEFAULT "condition-code";
DEFINE FIELD created_at ON has_condition_code TYPE datetime DEFAULT time::now();

-- has_observation_code: Relates an observation to its codeable concept (observation -> concept)
DEFINE TABLE has_observation_code TYPE RELATION FROM observation TO concept PERMISSIONS FULL;
DEFINE FIELD relationship_type ON has_observation_code TYPE string DEFAULT "observation-code";
DEFINE FIELD created_at ON has_observation_code TYPE datetime DEFAULT time::now();

-- has_observation_value: Relates an observation to its value codeable concept (observation -> concept)
DEFINE TABLE has_observation_value TYPE RELATION FROM observation TO concept PERMISSIONS FULL;
DEFINE FIELD relationship_type ON has_observation_value TYPE string DEFAULT "observation-value";
DEFINE FIELD created_at ON has_observation_value TYPE datetime DEFAULT time::now();

-- has_medication_code: Relates a medication to its codeable concept (medication -> concept)
DEFINE TABLE has_medication_code TYPE RELATION FROM medication TO concept PERMISSIONS FULL;
DEFINE FIELD relationship_type ON has_medication_code TYPE string DEFAULT "medication-code";
DEFINE FIELD created_at ON has_medication_code TYPE datetime DEFAULT time::now();

-- has_medication_ingredient: Relates a medication to ingredient concepts (medication -> concept)
DEFINE TABLE has_medication_ingredient TYPE RELATION FROM medication TO concept PERMISSIONS FULL;
DEFINE FIELD relationship_type ON has_medication_ingredient TYPE string DEFAULT "medication-ingredient";
DEFINE FIELD strength ON has_medication_ingredient TYPE object;
DEFINE FIELD created_at ON has_medication_ingredient TYPE datetime DEFAULT time::now();

-- prescribed_for: Relates a medication request to a condition (medication_request -> condition)
DEFINE TABLE prescribed_for TYPE RELATION FROM medication_request TO condition PERMISSIONS FULL;
DEFINE FIELD relationship_type ON prescribed_for TYPE string DEFAULT "reason";
DEFINE FIELD created_at ON prescribed_for TYPE datetime DEFAULT time::now();

-- medication_for: Relates a medication request to a medication (medication_request -> medication)
DEFINE TABLE medication_for TYPE RELATION FROM medication_request TO medication PERMISSIONS FULL;
DEFINE FIELD created_at ON medication_for TYPE datetime DEFAULT time::now();

-- has_medication_request_code: Relates a medication request to a codeable concept (medication_request -> concept)
DEFINE TABLE has_medication_request_code TYPE RELATION FROM medication_request TO concept PERMISSIONS FULL;
DEFINE FIELD relationship_type ON has_medication_request_code TYPE string DEFAULT "medication-code";
DEFINE FIELD created_at ON has_medication_request_code TYPE datetime DEFAULT time::now();

-- has_subject: Relates clinical resources to a patient (resource -> patient)
DEFINE TABLE has_subject TYPE RELATION FROM any TO patient PERMISSIONS FULL;
DEFINE FIELD created_at ON has_subject TYPE datetime DEFAULT time::now();

-- member_of: Relates a patient to an organization (patient -> organization)
DEFINE TABLE member_of TYPE RELATION FROM patient TO organization PERMISSIONS FULL;
DEFINE FIELD relationship_type ON member_of TYPE string DEFAULT "member";
DEFINE FIELD created_at ON member_of TYPE datetime DEFAULT time::now();

-- part_of: Relates an organization to its parent organization (child org -> parent org)
DEFINE TABLE part_of TYPE RELATION FROM organization TO organization PERMISSIONS FULL;
DEFINE FIELD relationship_type ON part_of TYPE string DEFAULT "part-of";
DEFINE FIELD created_at ON part_of TYPE datetime DEFAULT time::now();

-- has_part: Inverse relationship of part_of (parent org -> child org)
DEFINE TABLE has_part TYPE RELATION FROM organization TO organization PERMISSIONS FULL;
DEFINE FIELD relationship_type ON has_part TYPE string DEFAULT "has-part";
DEFINE FIELD created_at ON has_part TYPE datetime DEFAULT time::now();

-- ============================================================================
-- INDEXES FOR EFFICIENT QUERYING
-- ============================================================================

-- code_system indexes
DEFINE INDEX code_system_url_idx ON TABLE code_system COLUMNS url UNIQUE;
DEFINE INDEX code_system_name_idx ON TABLE code_system COLUMNS name;
DEFINE INDEX code_system_id_idx ON TABLE code_system COLUMNS id UNIQUE;

-- concept indexes
DEFINE INDEX concept_code_system_idx ON TABLE concept COLUMNS code, system UNIQUE;
DEFINE INDEX concept_display_idx ON TABLE concept COLUMNS display;
DEFINE INDEX concept_system_idx ON TABLE concept COLUMNS system;
DEFINE INDEX concept_code_idx ON TABLE concept COLUMNS code;
DEFINE INDEX concept_inactive_idx ON TABLE concept COLUMNS inactive;

-- value_set indexes
DEFINE INDEX value_set_url_idx ON TABLE value_set COLUMNS url UNIQUE;
DEFINE INDEX value_set_name_idx ON TABLE value_set COLUMNS name;
DEFINE INDEX value_set_id_idx ON TABLE value_set COLUMNS id UNIQUE;

-- concept_map indexes
DEFINE INDEX concept_map_url_idx ON TABLE concept_map COLUMNS url UNIQUE;
DEFINE INDEX concept_map_source_target_idx ON TABLE concept_map COLUMNS sourceUri, targetUri;
DEFINE INDEX concept_map_id_idx ON TABLE concept_map COLUMNS id UNIQUE;

-- naming_system indexes
DEFINE INDEX naming_system_name_idx ON TABLE naming_system COLUMNS name;
DEFINE INDEX naming_system_id_idx ON TABLE naming_system COLUMNS id UNIQUE;

-- Edge indexes for faster graph traversal
DEFINE INDEX belongs_to_out_idx ON TABLE belongs_to COLUMNS out;
DEFINE INDEX belongs_to_in_idx ON TABLE belongs_to COLUMNS in;

DEFINE INDEX parent_of_out_idx ON TABLE parent_of COLUMNS out;
DEFINE INDEX parent_of_in_idx ON TABLE parent_of COLUMNS in;
DEFINE INDEX parent_of_rel_type_idx ON TABLE parent_of COLUMNS relationship_type;

DEFINE INDEX part_of_out_idx ON TABLE part_of COLUMNS out;
DEFINE INDEX part_of_in_idx ON TABLE part_of COLUMNS in;
DEFINE INDEX part_of_rel_type_idx ON TABLE part_of COLUMNS relationship_type;

DEFINE INDEX has_part_out_idx ON TABLE has_part COLUMNS out;
DEFINE INDEX has_part_in_idx ON TABLE has_part COLUMNS in;
DEFINE INDEX has_part_rel_type_idx ON TABLE has_part COLUMNS relationship_type;

DEFINE INDEX has_parent_out_idx ON TABLE has_parent COLUMNS out;
DEFINE INDEX has_parent_in_idx ON TABLE has_parent COLUMNS in;

DEFINE INDEX includes_out_idx ON TABLE includes COLUMNS out;
DEFINE INDEX includes_in_idx ON TABLE includes COLUMNS in;
DEFINE INDEX includes_version_idx ON TABLE includes COLUMNS valueSetVersion;

DEFINE INDEX included_in_out_idx ON TABLE included_in COLUMNS out;
DEFINE INDEX included_in_in_idx ON TABLE included_in COLUMNS in;

DEFINE INDEX maps_to_out_idx ON TABLE maps_to COLUMNS out;
DEFINE INDEX maps_to_in_idx ON TABLE maps_to COLUMNS in;
DEFINE INDEX maps_to_cm_id_idx ON TABLE maps_to COLUMNS concept_map_id;

DEFINE INDEX mapped_from_out_idx ON TABLE mapped_from COLUMNS out;
DEFINE INDEX mapped_from_in_idx ON TABLE mapped_from COLUMNS in;
DEFINE INDEX mapped_from_cm_id_idx ON TABLE mapped_from COLUMNS concept_map_id;

-- Clinical resource indexes
DEFINE INDEX patient_id_idx ON TABLE patient COLUMNS id UNIQUE;
DEFINE INDEX observation_id_idx ON TABLE observation COLUMNS id UNIQUE;
DEFINE INDEX condition_id_idx ON TABLE condition COLUMNS id UNIQUE;
DEFINE INDEX medication_id_idx ON TABLE medication COLUMNS id UNIQUE;
DEFINE INDEX medication_request_id_idx ON TABLE medication_request COLUMNS id UNIQUE;

-- ============================================================================
-- UTILITY FUNCTIONS
-- ============================================================================

-- Function to add a concept to a code system
DEFINE FUNCTION fn::add_concept($code_system_id: string, $code: string, $display: string, $definition: string) {
    -- Check if concept already exists to avoid duplicates
    LET $existing = SELECT * FROM concept WHERE code = $code AND system = (
        SELECT url FROM code_system WHERE id = $code_system_id
    ) LIMIT 1;
    
    IF $existing {
        RETURN {
            concept: $existing,
            relationship: SELECT * FROM belongs_to WHERE out = $existing.id AND in = type::thing("code_system", $code_system_id) LIMIT 1,
            status: "existing"
        };
    };
    
    -- Get code system in one efficient query
    LET $code_system = SELECT id, url FROM code_system WHERE id = $code_system_id LIMIT 1;
    
    IF !$code_system {
        RETURN {
            error: "Code system not found",
            status: "error"
        };
    };
    
    -- Create the concept with system URL from the code system
    LET $concept = CREATE concept SET 
        code = $code,
        display = $display,
        definition = $definition,
        system = $code_system.url;
    
    -- Create the relationship using graph edges in a single transaction
    LET $belongs_to_rel = CREATE belongs_to SET 
        in = type::thing("code_system", $code_system_id), 
        out = $concept.id;
    
    RETURN {
        concept: $concept,
        relationship: $belongs_to_rel,
        status: "created"
    };
};

-- Function to add a parent-child relationship between concepts
DEFINE FUNCTION fn::add_concept_hierarchy($parent_code: string, $child_code: string, $system_url: string, $relationship_type: string) {
    -- Check if relationship already exists to avoid duplicates
    LET $existing_parent = SELECT * FROM concept WHERE code = $parent_code AND system = $system_url LIMIT 1;
    LET $existing_child = SELECT * FROM concept WHERE code = $child_code AND system = $system_url LIMIT 1;
    
    IF !$existing_parent || !$existing_child {
        RETURN {
            error: "One or both concepts not found",
            status: "error"
        };
    };
    
    -- Check if relationship already exists
    LET $existing_rel = SELECT * FROM parent_of WHERE 
        out = $existing_parent.id AND 
        in = $existing_child.id AND 
        relationship_type = $relationship_type 
    LIMIT 1;
    
    IF $existing_rel {
        RETURN {
            parent_of: $existing_rel,
            has_parent: (SELECT * FROM has_parent WHERE 
                out = $existing_child.id AND 
                in = $existing_parent.id AND 
                relationship_type = $relationship_type
            LIMIT 1),
            status: "existing"
        };
    };
    
    -- Create both relationships in a transaction
    
    -- Create the parent-of relationship using graph edges
    LET $parent_of_rel = CREATE parent_of SET
        in = $existing_child.id,
        out = $existing_parent.id,
        relationship_type = $relationship_type;
    
    -- Create the has-parent inverse relationship
    LET $has_parent_rel = CREATE has_parent SET
        in = $existing_parent.id,
        out = $existing_child.id, 
        relationship_type = $relationship_type;
        
    RETURN {
        parent_of: $parent_of_rel,
        has_parent: $has_parent_rel,
        status: "created"
    };
};

-- Function to create a value set with included concepts
DEFINE FUNCTION fn::create_value_set($id: string, $url: string, $name: string, $version: string, $concept_list: array) {
    -- Create the value set
    LET $value_set = CREATE value_set SET
        id = $id,
        url = $url,
        name = $name,
        version = $version,
        status = "active",
        date = time::now();
    
    -- Add each concept to the value set using graph edges
    LET $inclusions = [];
    LET $included_ins = [];
    
    FOR $concept_info IN $concept_list {
        LET $concept = SELECT * FROM concept 
            WHERE code = $concept_info.code 
            AND system = $concept_info.system 
            LIMIT 1;
        
        IF $concept {
            -- Create includes edge (value_set -> concept)
            LET $inclusion = CREATE includes SET
                in = $concept.id,
                out = $value_set.id,
                valueSetVersion = $version;
            
            -- Create included_in edge (concept -> value_set)
            LET $included_in = CREATE included_in SET
                in = $value_set.id,
                out = $concept.id,
                valueSetVersion = $version;
            
            $inclusions = $inclusions+ $inclusion;
            $included_ins = $included_ins+  $included_in;
        }
    };
    
    RETURN {
        valueSet: $value_set,
        inclusions: $inclusions,
        included_ins: $included_ins
    };
}