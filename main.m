 imgName = 'myImage.jpg';
 myImg = imread(imgName);


%myImg = [1 2 3; 4 5 6;7 8 9]

energyImage = energy_image(myImg);
%energyImage = [1 2 3; 4 5 6;7 8 9]
%imshow(energyImage);

cumMap = cumulative_minimum_energy_map(energyImage,'HORIZONTAL');
cumMap = [8 2 3; 20 43 1; 62 5 10; 2 3 1; 4 4 4];

num_rows = size(cumMap,1);
num_columns = size(cumMap,2);

myList = zeros(1,num_columns);
current_row = num_rows ;%start from the last row


myArray = cumMap(current_row,:); %gets last row


minimum = min(myArray); %minimum of bottom row
rowLookingAt = cumMap(num_rows,:)

if(numel(find(rowLookingAt == minimum)) > 1)
    tempVector = find(rowLookingAt == minimum)
    j = tempVector(1)
else
    j = find(myArray == minimum); % current column 
end
myList(current_row) = j %puts indices into vector



for i=num_rows:-1:2
    if j == 1
        myArray = [cumMap(i - 1, j), cumMap(i - 1, j + 1)];
                  %top and top right
    elseif j == num_columns
        myArray = [cumMap(i - 1, j -1), cumMap(i - 1, j)];
                  %top left and top
    else
        myArray = [cumMap(i - 1, j - 1), cumMap(i - 1, j), cumMap(i - 1, j + 1)];
    end
   
    minimum = min(myArray);
    rowLookingAt = cumMap(i-1,:); %get the row I'm looking at
    
    if(numel(find(rowLookingAt)) > 1)
        tempVector = find(rowLookingAt == minimum)
        j = tempVector(1)
    else
        j = find(rowLookingAt == minimum); % current column find which column its in
    end
    myList(i - 1) = j; %puts indices into vector,j is current column
end

myList
%cumMap
% 
% energyMatrix

        
      
        
        
        
