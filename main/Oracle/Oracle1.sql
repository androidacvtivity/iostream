SELECT 
    s.sid,
    s.serial#,
    s.username,
    s.osuser,
    s.machine,
    s.program,
    s.module,
    s.status,
    s.logon_time,
    s.terminal,
    s.type,
    p.spid AS os_process_id,
    s.process AS client_process_id,
    c.ip_address,
    p.pid,
    s.service_name
FROM 
    v$session s
JOIN 
    v$process p ON s.paddr = p.addr
LEFT JOIN 
    v$session_connect_info c ON s.sid = c.sid
WHERE 
    s.username IS NOT NULL
    AND c.TYPE = 'USER'
ORDER BY 
    s.logon_time DESC;
