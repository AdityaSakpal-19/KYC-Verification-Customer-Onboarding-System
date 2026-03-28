SELECT 
    ID,
    name,

    CASE 
        WHEN age < 18 THEN 'Rejected'
        
        WHEN pan IS NULL THEN 'Rejected'
        WHEN cleaned_aadhaar IS NULL THEN 'Rejected'
        
        WHEN NOT REGEXP_LIKE(pan, '^[A-Z]{5}[0-9]{4}[A-Z]$')
            THEN 'Rejected'
            
        WHEN LENGTH(cleaned_aadhaar) <> 12 
             OR NOT REGEXP_LIKE(cleaned_aadhaar, '^[0-9]+$')
            THEN 'Rejected'
            
        WHEN pan_aadhaar_linked = 'No'
            THEN 'In Process'
            
        WHEN voter_id IS NULL AND passport IS NULL
            THEN 'In Process'
            
        ELSE 'Accepted'
    END AS kyc_status,

    CASE 
        WHEN age < 18 THEN 'Underage'
        WHEN pan IS NULL THEN 'Missing PAN'
        WHEN cleaned_aadhaar IS NULL THEN 'Missing Aadhaar'
        WHEN NOT REGEXP_LIKE(pan, '^[A-Z]{5}[0-9]{4}[A-Z]$')
            THEN 'Invalid PAN'
        WHEN LENGTH(cleaned_aadhaar) <> 12 THEN 'Invalid Aadhaar Length'
        WHEN NOT REGEXP_LIKE(cleaned_aadhaar, '^[0-9]+$')
            THEN 'Invalid Aadhaar Format'
        WHEN pan_aadhaar_linked = 'No'
            THEN 'PAN-Aadhaar not linked'
        WHEN voter_id IS NULL AND passport IS NULL
            THEN 'Additional document required'
        ELSE 'Valid'
    END AS reason

FROM kyc_info;