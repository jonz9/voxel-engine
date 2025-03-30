class Vector3d {
    public:
        float x;
        float y;
        float z;

        // Constructor  
        Vector3d(float x, float y, float z);

        // Destructor
        ~Vector3d();
};

Vector3d::Vector3d(float x, float y, float z) {
    this->x = x;
    this->y = y;
    this->z = z;
}