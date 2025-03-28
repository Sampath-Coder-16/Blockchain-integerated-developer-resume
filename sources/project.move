module MyModule::DeveloperResume {

    use aptos_framework::signer;

    /// Struct representing a developer's resume.
    struct Resume has store, key {
        experience: vector<u8>,  // Encoded experience details
    }

    /// Function to create a new resume.
    public fun create_resume(owner: &signer, experience: vector<u8>) {
        let resume = Resume { experience };
        move_to(owner, resume);
    }

    /// Function to update an existing resume.
    public fun update_resume(owner: &signer, new_experience: vector<u8>) acquires Resume {
        let resume = borrow_global_mut<Resume>(signer::address_of(owner));
        resume.experience = new_experience;
    }
}
