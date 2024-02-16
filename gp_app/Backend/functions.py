import os
import torch
from PIL import Image
import torch.nn as nn
from torch.autograd import Variable
from torchvision import models
from torchvision import transforms

    


# Function to load the saved model
def load_model():
    # Print the current working directory
    print("Current working directory:", os.getcwd())
    # Specify the full path to the model file
    model_path = 'best_model.pkl'
    # Check if the model file exists
    if not os.path.exists(model_path):
        raise FileNotFoundError(f"Model file '{model_path}' not found.")
    # Load the saved model
    model = torch.load("best_model.pkl", map_location=torch.device('cuda' if torch.cuda.is_available() else 'cpu'))
    model.eval()    # Set the model to evaluation mode
    return model # Return the loaded model


# Function to transform the input image to match the trained dataset
def transform(img):
    # Define image transformations
    transform = transforms.Compose([
        transforms.Resize((224, 224)),
        transforms.ToTensor(),
        transforms.Normalize([0.485, 0.456, 0.406], [0.229, 0.224, 0.225]),
    ])
    # Transform the image
    img = transform(img)
    img = img.unsqueeze(0)  # Add batch dimension
    # Convert the input to a Variable
    img = Variable(img)
    return img  # Return the transformed image


# Function to Load & preprocess the input image
def load_img():
    # Load and preprocess the input image
    image_path = 'C:/Users/saraa/Downloads/Test Images/Woman.jpg'
    img = Image.open(image_path)
    return img


# Function to predict the output of the model
def predict(model, img):
    output = model(img)
    #print(output)
    # Postprocess predictions if needed
    
    # Get the predicted class
    probabilities, predicted_class = torch.max(output.data, 1)
    predicted_class = predicted_class.item()
    # Display or use predictions as needed
    print(probabilities)
    return predicted_class # Return the output of the model


# Function to convert the input image (binary data) to image object
def convert_to_obj(bytes_img, output_file_path):
    # Create a BytesIO object
    #bytes_io = io.BytesIO(bytes_data)
    # Use PIL to open the image from BytesIO
    image = Image.open(bytes_img)
    # Save the image to a file
    image.save(output_file_path)
    return image
    



# Function to check the validaty of the signed up password
def password_val(password):
    pass



# Function to check the validaty of the signed up email
def email_val(email):
    pass