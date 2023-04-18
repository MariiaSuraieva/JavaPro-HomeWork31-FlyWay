CREATE OR REPLACE FUNCTION update_users_modified()
RETURNS TRIGGER AS $$
BEGIN
    NEW.modified = NOW();
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER users_update_trigger
    BEFORE UPDATE ON users
    FOR EACH ROW
    EXECUTE FUNCTION update_users_modified();